class CreateWards < ActiveRecord::Migration[6.1]
  def change
    create_table :wards do |t|
      t.string :_name
      t.string :_prefix
      t.integer :_province_id
      t.integer :_district_id

      t.timestamps:null => true
    end
  end
end
