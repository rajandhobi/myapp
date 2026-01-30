namespace :worker do
  desc "Run Solid Queue Worker on Windows"
  task run: :environment do
    puts "Starting Solid Queue Worker for Windows..."
    
    worker_instance = SolidQueue::Worker.new(queues: ["development.default", "default"])
    worker_instance.start
    loop do
      worker_instance.wake_up 
      sleep 2
    end
  end
end