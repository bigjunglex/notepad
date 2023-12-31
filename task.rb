require 'date'
class Task < Post
  def initialize
    super

    @due_date = Time.now
  end
  def read_from_console
    puts "What is the task?"
    @text = STDIN.gets.chomp

    puts "What is deadline? (type in date in 27.04.2023 format)"
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    dealdine = "Deadline : #{@due_date}"

    return [deadline, @text, time_string]
  end

  def to_db_hash
    return super.merge(
        {
            'text' => @text,
            'due_date' => @due_date.to_s
        }
    )
  end

  def load_data(data_hash)
    super(data_hash)
    @text = data_hash['text']
    @due_date = Date.parse(data_hash['due_date'])
  end
end