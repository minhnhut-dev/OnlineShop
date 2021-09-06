class AddImageProductToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :image_product, :string
  end
end
