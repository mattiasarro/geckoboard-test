class WordSource
  def initialize(content="")
    @words = content.split(",").map(&:strip).reject(&:empty?)
    @idx = 0
  end
  
  def run
    while next_word
    end
  end

  def next_word
    ret = @words[@idx]
    @idx = @idx + 1 if ret
    ret
  end

  def top_5_consonants
    raise NotImplementedError, "You should implement this method"
  end

  def top_5_words
    raise NotImplementedError, "You should implement this method"
  end

  def count
    @idx
  end

  def callback
    raise NotImplementedError, "You should implement this method"
  end
end