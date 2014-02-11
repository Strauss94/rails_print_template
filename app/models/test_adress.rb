class TestAdress < ActiveRecord::Base
  extend PrintTemplate::DataHook

  template_field :title
  template_field :first_name
  template_field :name
  template_field :street
  template_field :zip
  template_field :city
  template_field :birthday

  template_field :mist
end
