class TwitterWordSource < WordSource
  
  def initialize(tweet_id)
    super Twitter.status(tweet_id).text
  end
  
end