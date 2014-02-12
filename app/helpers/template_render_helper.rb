module TemplateRenderHelper
  def render_print_template_as_pdf(template, filename="MyPDF")
    @template = template
    render pdf: filename,
      file: "lib/rails_print_template.pdf.erb",
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