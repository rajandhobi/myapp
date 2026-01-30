class WelcomeCityEmailJob < ApplicationJob

  retry_on Net::OpenTimeout, wait: :exponentially_longer, attempts: 5
  queue_with_priority do
    city_id = self.arguments.first
    city_id < 10 ? 0 : 10
  end

  limits_concurrency key: ->(city_id) { city_id }, group: "CityOperations", to: 1, duration: 10.minutes

  before_perform do |job|
    puts "--- 1. [Before] Preparing cleanup for City ID: #{job.arguments.first} ---"
  end

  around_perform do |job, block|
    puts "--- 2. [Around - Start] Starting cleanup for City ID: #{job.arguments.first} ---"
    block.call
    puts "--- 4. [Around - End] Finished block execution ---"
  end

  after_perform do |job|
    puts "--- 5. [After] Completed cleanup for City ID: #{job.arguments.first} ---"
  end

  def perform(city)
    city = City.find(city_id)
    puts "--- 3. [Perform] Processing: #{city.name} ---"
    sleep 5 
  end
end