class AddKindToVehicles < ActiveRecord::Migration[8.1]
  def change
    add_column :vehicles, :kind, :string
  end
end

