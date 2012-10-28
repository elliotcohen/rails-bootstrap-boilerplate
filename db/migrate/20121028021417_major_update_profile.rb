class MajorUpdateProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :full_name
    remove_column :profiles, :country
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :social, :string
    add_column :profiles, :street, :string
    add_column :profiles, :street2, :string
    add_column :profiles, :state, :string
    add_column :profiles, :zipcode, :string
  end

  def down
    add_column :profiles, :full_name, :string
    add_column :profiles, :country, :string
    remove_column :profiles, :first_name
    remove_column :profiles, :last_name
    remove_column :profiles, :social
    remove_column :profiles, :street
    remove_column :profiles, :street2
    remove_column :profiles, :state
    remove_column :profiles, :zipcode
  end
end
