class LoremIpsumWordSource < WordSource
  
  def initialize(location)
    @words = File.read(location).split(",").map(&:strip)
  end
  
  def count
    @words.size
  end
  
end