Twitter.configure do |config|
  config.consumer_key = ENV["GECKO_TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["GECKO_TWITTER_CONSUMER_SECRET"]
end