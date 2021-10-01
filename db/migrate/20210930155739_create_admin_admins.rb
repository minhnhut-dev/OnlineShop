class CreateAdminAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_admins do |t|
      t.string :name
      t.boolean :active
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
