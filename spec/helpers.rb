module Helpers
  def source_from_string(mock_data)
    f = Tempfile.new("word_source") 
    f.write(mock_data)
    f.close
    return LoremIpsumWordSource.new(f.path), f
  end
end