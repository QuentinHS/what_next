require "tty-prompt"
require 'colorize'
require_relative "./classes/user.rb"
require_relative './errors/invalid_input_error'

# Present welcome message to the user 

def intro
  puts "Welcome to 'What Next?', a terminal-based application to help you decide on your future career path!".green 
end

intro
prompt = TTY::Prompt.new

name = prompt.ask("Can we start with your name? You can just press 'enter' to remain anonymous.".magenta, default: "anonymous").strip
user = User.new(name)
puts "Hi #{user.name}!  At any time you can also type '-h' or '--help' at the command line for instructions on what you can do.".cyan

answer = prompt.select("What would you like to do next?".yellow, %w(Quiz Compare Search Help About))

case answer
when "Quiz"
  puts "placeholder1"
when "Compare"
  puts "placeholder2"
when "Search"
  puts "placeholder3"
when "Help"
  puts "placeholder4"
when "About"
  puts "placeholder5"
end