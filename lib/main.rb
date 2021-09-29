require "tty-prompt"
require 'colorize'
require "json"
require_relative "./classes/user"
require_relative './classes/occupation'
# require_relative 'classes/UserInterface'
require_relative './errors/invalid_input_error'
require_relative "./comparison"
require_relative './help.rb'


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
  # run quiz help function to introduce quiz functionality
  quiz_help
  # begin quiz to add user personality information to profile
  user.personality_profile.quiz
  user.personality_profile.generate_personality_map
  user.generate_personality_type
  
when "Compare"
  compare_help
  begin 
  jobs = get_occupation("./occupation_data.json")
  rescue => e
    puts e.message
    retry
  end
  
  answer = prompt.select("By which metric which you like to compare these jobs?".yellow, %w(Salary, Growth), 'Job Size',)
  
when "Search"
  puts "placeholder3"
when "Help"
  puts "placeholder4"
when "About"
  puts "placeholder5"
end