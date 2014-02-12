class CreateTestAdresses < ActiveRecord::Migration
  def change
    create_table :test_adresses do |t|
      t.string :name
      t.string :first_name
      t.string :street
      t.string :title
      t.string :zip
      t.string :city
      t.date :birthday

      t.timestamps
    end
  end
end
