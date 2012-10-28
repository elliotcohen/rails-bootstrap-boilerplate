class ChangeStateIdToString < ActiveRecord::Migration
  def up
    add_column :profiles, :state, :string
    remove_column :profiles, :state_id
  end

  def down
    remove_column :profiles, :state
    add_column :profiles, :state_id
  end
end
