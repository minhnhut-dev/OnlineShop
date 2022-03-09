class CreateKaKas < ActiveRecord::Migration[6.1]
  def change
    create_table :ka_kas do |t|

      t.timestamps
    end
  end
end
