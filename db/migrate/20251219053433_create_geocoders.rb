class CreateGeocoders < ActiveRecord::Migration[8.1]
  def change
    create_table :geocoders do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
