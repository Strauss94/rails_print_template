module PrintTemplatesHelper
  # TinyMCE provides all styling information for the text itself,
  # but didn't define boundaries to paper formats, which we need
  # to output a nice printable PDF
  # Therefore this function resolves the template format infos to
  # css style-elements
  def style_for(template)
    style = []
    #style << "width: #{template.width - template.margin_left - template.margin_right}mm"
    #style << "height: #{template.height - template.margin_top - template.margin_bottom}mm"
    %w{width height margin_left margin_right margin_top margin_bottom}.each do |attr|
      style << [attr.gsub('margin_', 'padding-'), template.send(attr)].join(':')+'mm' unless template.send(attr).blank?
    end
    style.join(';')
  end

  def tiny_mce_data_button
    str = <<-TINY
      function(editor) {
              editor.addButton('template_data_button', {
                  type: 'menubutton',
                  text: 'Variablen',
                  icon: false,
                  menu: [
    TINY

    PrintTemplate.fields.each do |group, elements|
      elements.each do |ele|
        str += "{text: '#{ele}', onclick: function() {editor.insertContent('##{ele.upcase}#');}},\n"
      end
    end

    str += <<-MCE
                  ]
              });
          }
        });
    MCE
  end
end
