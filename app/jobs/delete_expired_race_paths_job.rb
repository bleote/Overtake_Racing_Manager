class DeleteExpiredRacePathsJob < ApplicationJob
  queue_as :default

  def perform
    Race.where("created_at <= ?", 2.days.ago).destroy_all
  end
end
