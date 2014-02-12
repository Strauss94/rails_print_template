$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_print_template/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_print_template"
  s.version     = RailsPrintTemplate::VERSION
  s.authors     = ["Holger Arndt"]
  s.email       = [""]
  s.homepage    = "www.kjarrigan.de"
  s.summary     = "A simple approach to generate (letter)templates with tinymce and connect them to your data to render PDF's"
  s.description = "There is not more to say."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "wkhtmltopdf-binary"
  s.add_dependency "wicked_pdf"
  # s.add_dependency 'tinymce-rails', git: 'https://github.com/spohlenz/tinymce-rails.git', branch: 'tinymce-4'

  s.add_development_dependency "sqlite3"
end
