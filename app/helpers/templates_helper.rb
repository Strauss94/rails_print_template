module TemplatesHelper
  # TinyMCE provides all styling information for the text itself,
  # but didn't define boundaries to paper formats, which we need
  # to output a nice printable PDF
  # Therefore this function resolves the template format infos to
  # css style-elements
  def style_for(template)
    style = []
    %w{height width margin_left margin_right margin_top margin_bottom}.each do |attr|
      style << [attr.gsub('margin_', 'padding-'), template.send(attr)].join(':')+'mm' unless template.send(attr).blank?
    end
    style.join(';')
  end
end
