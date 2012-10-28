class CreateInsurance < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.references :profile
      t.string :front_photo_file_name
      t.string :front_photo_content_type
      t.integer :front_photo_file_size
      t.datetime :front_photo_updated_at
      t.string :back_photo_file_name
      t.string :back_photo_content_type
      t.integer :back_photo_file_size
      t.datetime :back_photo_updated_at
      
      t.string :bin
      t.string :pcn
      t.string :id_number

      t.timestamps
    end
  end
end
