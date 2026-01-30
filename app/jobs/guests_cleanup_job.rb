class GuestsCleanupJob < ApplicationJob
  queue_as :low_priority

  def perform(*args)
puts "Starting guests cleanup job..."
  end
end
