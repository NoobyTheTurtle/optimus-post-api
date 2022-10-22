class HogeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sleep 10
    puts "Hello world"
  end
end
