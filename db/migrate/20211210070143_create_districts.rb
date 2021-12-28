class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :prefix
      t.integer :province_id

      t.timestamps:null => true
    end
  end
end
