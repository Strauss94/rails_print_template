class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_print_template_as_pdf(template, filename="MyPDF")
    @template = template
    render pdf: filename,
      file: "#{Rails.root}/app/views/print_templates/show.pdf.erb",
      layout: false,
      page_height: template.height.to_s + 'mm',
      page_width: template.width.to_s + 'mm',
      margin: {
        top: template.margin_top.to_s + 'mm',
        bottom: template.margin_bottom.to_s + 'mm',
        right: template.margin_right.to_s + 'mm',
        left: template.margin_left.to_s + 'mm'
      }
  end
end
