class AddVisitedOnToPlaces < ActiveRecord::Migration[8.1]
  def change
    add_column :places, :visited_on, :date
  end
end
