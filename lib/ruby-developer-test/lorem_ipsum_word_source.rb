class LoremIpsumWordSource < WordSource
  
  def initialize(location="lorem_ipsum.txt")
    @words = File.read(location).split(",").map(&:strip)
  end
  
  def count
    @words.size
  end
  
end