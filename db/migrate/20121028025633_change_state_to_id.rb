class ChangeStateToId < ActiveRecord::Migration
  def up
    add_column :profiles, :state_id, :integer
    remove_column :profiles, :state
  end

  def down
    add_column :profiles, :state, :string
    remove_column :profiles, :state_id, :integer
  end
end
