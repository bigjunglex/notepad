class Link < Post
  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts "Link :"
    @url = STDIN.gets.chomp

    puts "What is this link?"
    @text = STDIN.gets.chomp
  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")}"

    return [@url, @text, time_string]
  end

  def to_db_hash
    return super.merge(
    {
        'text' => @text,
        'url' => @url
    }
    )
  end

  def load_data(data_hash)
    super(data_hash)
    @text = data_hash['text']
    @url = data_hash['url']
  end
end