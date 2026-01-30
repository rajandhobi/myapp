class AddTimeZoneToPlaces < ActiveRecord::Migration[8.1]
  def change
    add_column :places, :time_zone, :string
  end
end
