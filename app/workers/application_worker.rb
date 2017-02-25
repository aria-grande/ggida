class ApplicationWorker
  include Sidekiq::Worker

  sidekiq_options retry: 5

  def perform(*args)
    Party.make_done_after_start_date
  end
end
