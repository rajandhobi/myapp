class AddDeletedAtToCities < ActiveRecord::Migration[8.1]
  def change
    add_column :cities, :deleted_at, :datetime
  end
end
