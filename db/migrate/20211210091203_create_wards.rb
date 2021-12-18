class CreateWards < ActiveRecord::Migration[6.1]
  def change
    create_table :wards do |t|
      t.string :name
      t.string :prefix
      t.integer :province_id
      t.integer :district_id

      t.timestamps:null => true
    end
  end
end
