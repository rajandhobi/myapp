class AddSuperAdminToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :superadmin, :boolean
  end
end
