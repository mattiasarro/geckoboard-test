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
    
    describe "next_word()" do
      it "should return the next word as a string" do
        source = WordSource.new "lorem,ipsum,ipsum"
        source.next_word.should == "lorem"
        source.next_word.should == "ipsum"
        source.next_word.should == "ipsum"
      end
      
      it "should return nil if there are no more words" do
        source = WordSource.new "lorem,ipsum"
        source.next_word.should == "lorem"
        source.next_word.should == "ipsum"
        source.next_word.should == nil
      end

      it "should keep track of the words it has encountered" do
        source = WordSource.new "Lorem, ipsum, dolor, sit, amet"
        source.count.should == 0
        source.next_word
        source.count.should == 1
        source.next_word
        source.count.should == 2
        source.next_word
        source.count.should == 3
      end
    end
    
    describe "run()" do
      it "should count all words with run()" do
        source = WordSource.new "Lorem,ipsum,dolor,sit,amet"
        source.run
        source.count.should == 5
      end
    
      it "should continue looping from previous location set by next_word()" do
        source = WordSource.new "Lorem,ipsum,dolor,sit,amet"
        source.next_word
        source.next_word
        source.count.should == 2
        source.run
        source.count.should == 5
      end
    end
    
    describe "parsing the input string" do
      it "should parse the correct number of words" do
        source = WordSource.new "lorem,ipsum"
        source.run
        source.count.should == 2
      end

      it "should reject empty strings" do
        source = WordSource.new "lorem,ipsum,"
        source.run
        source.count.should == 2
        
        source = WordSource.new "lorem,ipsum,,"
        source.run
        source.count.should == 2
        
        source = WordSource.new ",lorem,,ipsum,"
        source.run
        source.count.should == 2
      end
    end
  end
end
