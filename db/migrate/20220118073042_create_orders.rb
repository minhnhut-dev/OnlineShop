class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment_id
      t.decimal :total
      t.datetime :orderdate
      t.integer :order_status_id

      t.timestamps
    end
  end
end
