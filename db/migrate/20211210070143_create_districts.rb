class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.string :_name
      t.string :_prefix
      t.integer :_province_id

      t.timestamps:null => true
    end
  end
end
