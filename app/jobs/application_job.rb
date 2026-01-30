class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked
self.enqueue_after_transaction_commit = true
  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  rescue_from(StandardError) do |exception|
    Rails.logger.error "!!! Job in error : #{exception.message} !!!"
    Rails.error.report(exception) 
    raise exception 
  end
end
