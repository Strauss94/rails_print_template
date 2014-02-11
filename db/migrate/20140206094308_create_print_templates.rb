class CreatePrintTemplates < ActiveRecord::Migration
  def change
    create_table :print_templates do |t|
      t.string :name
      t.text :body

      # Paperformat in mm
      t.integer :height
      t.integer :width
      t.integer :margin_left
      t.integer :margin_right
      t.integer :margin_top
      t.integer :margin_bottom

      t.timestamps
    end
  end
end
