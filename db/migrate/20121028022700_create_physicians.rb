class CreatePhysicians < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end
end
