require 'spec_helper'

describe TwitterWordSource, "#TwitterWordSource" do
  describe "mocked out" do    
    # if our program were more complex, most tests
    # would be in this block
    before :each do
      @id = 100
      canned_response = File.new "spec/twitter_responses/#{@id}.json"
      stub_request(:get, "http://api.twitter.com/1.1/statuses/show.json?id=#{@id}").to_return canned_response
      stub_request(:post, "https://#{ENV["GECKO_TWITTER_CONSUMER_KEY"]}:#{ENV["GECKO_TWITTER_CONSUMER_SECRET"]}@api.twitter.com/oauth2/token").
               with(:body => "grant_type=client_credentials",
                    :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded; charset=UTF-8', 'User-Agent'=>'Twitter Ruby Gem 4.8.0'}).
               to_return(:status => 200, :body => "", :headers => {})
    end
    
    it "should initialize from tweet ID" do
      expect { TwitterWordSource.new(@id) }.to_not raise_error
    end
    
    it "should parse the comma-separated status text" do
      
    end
    
    it "should throw an exception for a tweet with an incorrect ID" do
      
    end
  end
  
  # a simple smoke test to see if our API keys are set up,
  # and our Ruby gem communicates with the remote
  it "should connect to the actual Twitter API" do
    # do an actual GET request
  end
end