require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'task.rb'
require_relative 'memo.rb'

puts "Hello, i'm your notepad1"
puts "Whats your desired entry?"

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size
  choices.each_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice  = STDIN.gets.chomp.to_i
end

entry = Post.create(choice)
entry.read_from_console
entry.save
puts "Entry saved"