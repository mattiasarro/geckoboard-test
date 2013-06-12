class WordSource
  def initialize(content="")
    @words = content.split(",").map(&:strip).reject(&:empty?)
    @words_cnt = Hash.new(0)
    @idx = 0
  end
  
  def run
    while next_word
    end
  end

  def next_word
    @words[@idx].tap do |word|
      if word
        @words_cnt[word] += 1
        @idx = @idx + 1
      end
    end
  end

  def top_5_consonants
    raise NotImplementedError, "You should implement this method"
  end

  def top_5_words
    return @top_5_words if @top_5_words
    run
    sorted = Hash[@words_cnt.sort_by {|word,count| -count}]
    top_words = sorted.keys[0,5]
    @top_5_words = Array.new(5) {|i| top_words[i] }
  end

  def count
    @idx
  end

  def callback
    raise NotImplementedError, "You should implement this method"
  end
end