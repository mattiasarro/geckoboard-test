require 'spec_helper'
require 'tempfile'

describe LoremIpsumWordSource, "#WordSource" do
  include Helpers
  it "should take valid text file location as initialization argument" do
    source = LoremIpsumWordSource.new("lorem_ipsum.txt")
  end
  
  it "should raise an exception on incorrect file location" do
    expect{ LoremIpsumWordSource.new("no-file.txt") }.to raise_error
  end
  
  it "should take its input by default from lorem_ipsum.txt" do
    source = LoremIpsumWordSource.new
    source.count.should == 4946
  end
  
  it "should read the comma-separated words in the file into an array" do
    source, f = source_from_string "lorem,ipsum"
    source.count.should == 2
    f.unlink
  end
end