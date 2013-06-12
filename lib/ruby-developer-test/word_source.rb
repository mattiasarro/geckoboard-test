class WordSource
  def initialize(content="")
    @words = content.split(",").map(&:strip).reject(&:empty?)
    @words_cnt = Hash.new(0)
    @callbacks = Hash.new
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
        callback(word)
      end
    end
  end

  def top_5_consonants
    consonants = /[b-df-hj-np-tv-z]/i
    @chars_cnt ||= chars_cnt.select { |char,_| char =~ consonants }
    @top_5_consonants ||= top(5, @chars_cnt)
  end

  def top_5_words
    @top_5_words ||= top(5, @words_cnt)
  end

  def count
    @idx
  end
  
  def register_callback(on_word, callback_lambda)
    @callbacks[on_word] = callback_lambda
  end
  
  def callback(on_word)
    if (callback = @callbacks[on_word])
      callback.call
    end
  end
  
  private
    def top(nr, items)
      run
      sorted = Hash[items.sort_by {|item,count| [-count, item]}]
      top_words = sorted.keys[0,5]
      @top_5_words = Array.new(5) {|i| top_words[i] }
    end
    
    def chars_cnt
      run
      Hash.new(0).tap do |occurrences|
        @words_cnt.each do |word,cnt|
          word.each_char do |char|
            # could do checking for consonants here,
            # though that would give no substantial performance gain:
            # we're still looping through each char
            occurrences[char] += cnt
          end
        end
      end
    end
end