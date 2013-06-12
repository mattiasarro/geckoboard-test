class WordSource
  def initialize(content="")
    @words = content.split(",").map(&:strip).reject(&:empty?)
  end
  
  def run
    raise NotImplementedError, "You should implement this method"
  end

  def next_word
    raise NotImplementedError, "You should implement this method"
  end

  def top_5_consonants
    raise NotImplementedError, "You should implement this method"
  end

  def top_5_words
    raise NotImplementedError, "You should implement this method"
  end

  def count
    @words.size
  end

  def callback
    raise NotImplementedError, "You should implement this method"
  end
end