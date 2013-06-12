class LoremIpsumWordSource < WordSource
  
  def initialize(location="lorem_ipsum.txt")
    super File.read(location)
  end
  
end