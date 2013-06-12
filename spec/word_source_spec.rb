require 'spec_helper'

describe WordSource, "#WordSource" do
  describe "the interface" do
    it "should be able to run continuously until wordsource is depleted" do
       source = WordSource.new
       source.should respond_to :run
    end
  
    it "should respond to next_word" do
       source = WordSource.new
       source.should respond_to :next_word
    end

    it "should respond to top 5 consonants" do
       source = WordSource.new
       source.should respond_to :top_5_consonants
    end

    it "should respond to top 5 words" do
       source = WordSource.new
       source.should respond_to :top_5_words
    end

    it "should respond to count" do
       source = WordSource.new
       source.should respond_to :count
    end

    it "should respond to callback" do
       source = WordSource.new
       source.should respond_to :callback
    end
  end
  
  describe "the implementation" do
    it "should initialize from string" do
      expect { WordSource.new("lorem,ipsum,ipsum") }.to_not raise_error
    end
    
    it "should parse the correct number of words" do
      source = WordSource.new "lorem,ipsum"
      source.count.should == 2
    end

    it "should reject empty strings" do
      source = WordSource.new "lorem,ipsum,"
      source.count.should == 2
      source = WordSource.new "lorem,ipsum,,"
      source.count.should == 2
      source = WordSource.new ",lorem,,ipsum,"
      source.count.should == 2
    end
    
  end
end
