require "tty-prompt"
require 'colorize'
require "json"
require_relative "./user"
require_relative './occupation'
require_relative '../errors/invalid_input_error'
require_relative "../comparison"
require_relative '../help'

class UserInterface
  attr_accessor :user, :prompt, :answer, :jobs
  def initialize(data)
    @user = nil
    # Create new prompt
    @prompt = TTY::Prompt.new
    @answer = nil
    @jobs = nil
  end

  def intro
    puts "Welcome to 'What Next?', a terminal-based application to help you decide on your future career path!".green 
  end

   def create_user
  
    # Ask user for name input
    name = @prompt.ask("Can we start with your name? You can just press 'enter' to remain anonymous.".magenta, default: "anonymous").strip.capitalize
    # Create new user object with name parameter 
    @user = User.new(name)

    puts "Hi #{self.user.name}! If you're feeling a bit lost, you're welcome to take a short quiz that will hopefully give you a few helpful suggestions. If you already know your personality type (say you've done a Myer-Briggs or Keirsey-style test before), you can also search for jobs that might suit your personality type. Or you can just compare two career options directly.".cyan
  end

  def show_menu
    # Ask user which option they want to select
    answer = @prompt.select("What would you like to do next?".yellow, %w(Quiz Compare Search Help About))
    @answer = answer
  end


end