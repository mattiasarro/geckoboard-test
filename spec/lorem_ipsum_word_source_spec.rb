require 'spec_helper'
require 'tempfile'

describe LoremIpsumWordSource, "#WordSource" do
  
  it "should take valid text file location as initialization argument" do
    source = LoremIpsumWordSource.new("lorem_ipsum.txt")
  end
  
  it "should raise an exception on incorrect file location" do
    expect{ LoremIpsumWordSource.new("no-file.txt") }.to raise_error
  end
  
  it "should read the comma-separated words in the file into an array" do
    source, f = source_from_string "lorem,ipsum"
    source.count.should == 2
    f.unlink
  end
  
  it "should reject empty strings" do
    source, f = source_from_string "lorem,ipsum,,"
    source.count.should == 2
    f.unlink
  end
  
  def source_from_string(mock_data)
    f = Tempfile.new("temp") 
    f.write(mock_data)
    f.close
    return LoremIpsumWordSource.new(f.path), f
  end
end