class PrintTemplate < ActiveRecord::Base
  class DataMatchingError < RuntimeError; end

  module DataHook
    def template_field(field)
      PrintTemplate.fields[self.model_name] ||= []
      PrintTemplate.fields[self.model_name] << field
    end

    def self.extended(base)
      base.send :define_method, :render_with_template do |t| t.render_template_with(self) end
      super
    end
  end

  def self.fields
    @@__available_template_data_fields ||= {}
    @@__available_template_data_fields
  end

  def variable_fields
    self.body.scan(/<a id="(\w*)" href="#\w*">#.*?#<\/a>/).flatten.map(&:to_sym)
  end

  def render_template_with(data)
    variable_fields.each do |fld|
      raise DataMatchingError, "Given data has no field: #{fld}!" unless data.respond_to?(fld)
      self.body.gsub!(/<a id="#{fld.to_s}" href="#\w*">#.*?#<\/a>/, data.send(fld))
    end

    return self
  end
end
