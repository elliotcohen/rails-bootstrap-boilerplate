class FixReferences < ActiveRecord::Migration
  def up
    add_column :insurances, :user_id, :integer
    remove_column :insurances, :profile_id
    add_column :physicians, :user_id, :integer
  end

  def down
    remove_column :insurances, :user_id
    add_column :insurances, :profile_id, :integer
    remove_column :physicians, :user_id
  end
end
