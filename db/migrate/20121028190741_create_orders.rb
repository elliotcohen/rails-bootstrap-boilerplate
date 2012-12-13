class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.timestamps
    end
    create_table :medications do |t|
      t.string :name
    end
    create_table :orders_medications, :id => false do |t|
      t.references :orders, :medications
      t.string :dose
    end
  end

  def down
    drop_table :orders
    drop_table :medications
    drop_table :orders_medications
  end
end
