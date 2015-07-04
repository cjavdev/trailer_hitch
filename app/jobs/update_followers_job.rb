class UpdateFollowersJob < ActiveJob::Base
  queue_as :default

  rescue_from(Twitter::Error::TooManyRequests) do |exception|
    puts "Too many requests for now..."
    retry_in(20.minutes)
  end

  def perform(u)
    puts "UPDATING IN --- "
    u.update_in_profiles2
    puts "UPDATING OUT --- "
    u.update_out_profiles2
    puts "DONE --- "
  end
end
