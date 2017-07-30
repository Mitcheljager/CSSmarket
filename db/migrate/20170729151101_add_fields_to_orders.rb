class AddFieldsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :amount, :integer
    add_column :orders, :description, :string
    add_column :orders, :customer_id, :string
    add_column :orders, :source, :string
  end
end
