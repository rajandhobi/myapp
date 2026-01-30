class AddStatusToOrder < ActiveRecord::Migration[8.1]
  def up
    add_column :orders, :status, :string, default: "pending"
    puts "added successfully" 
  end

  def down  
    remove_column :orders, :status, :string
    puts "remove successfully"
  end
end


