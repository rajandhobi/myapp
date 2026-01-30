class CityDataCleanupJob < ApplicationJob
  queue_as :default
  limits_concurrency key: ->(city_id) { city_id }, group: "CityOperations", to: 1, duration: 15.minutes

  
  def perform(city_id)
    city = City.find(city_id)
    puts "--- start processing!!: #{city.name} ---"
    sleep 5 
    puts "--- processing complete: #{city.name} ---"
  end
end

