class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.string :_name
      t.string :_code

      t.timestamps:null => true
    end
  end
end
