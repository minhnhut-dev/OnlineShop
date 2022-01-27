class RemoveColumnIdOrderDetail < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_details, :id, :integer
  end
end
