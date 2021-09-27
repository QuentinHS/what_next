require "tty-prompt"
require 'colorize'
require_relative "./classes/user"
require_relative './classes/UserInterface'
require_relative './personality_test'
require_relative './errors/invalid_input_error'


# Present welcome message to the user 

def intro
  puts "Welcome to 'What Next?', a terminal-based application to help you decide on your future career path!".green 
 
end

intro

prompt = TTY::Prompt.new
name = prompt.ask("Can we start with your name? You can just press 'enter' to remain anonymous.".magenta, default: "anonymous").strip
user = User.new(name)
puts "Hi #{user.name}! If you're feeling a bit lost, you're welcome to take a short quiz that will hopefully give you a few helpful suggestions. If you already know your personality type (say you've done a Myer-Briggs or Keirsey-style test before), you can also search for jobs that might suit your personality type. Or you can just compare two career options directly.".cyan

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