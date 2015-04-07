puts "KEY AND SECRET"
p ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
