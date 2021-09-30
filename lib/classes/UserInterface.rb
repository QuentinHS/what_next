require "tty-prompt"
require 'colorize'
require "json"
require_relative "./user"
require_relative './occupation'
require_relative '../errors/invalid_input_error'
require_relative "../comparison"
require_relative '../modules/help'

class UserInterface
  attr_accessor :user, :prompt, :answer, :jobs
  include Help
  def initialize
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
    answer = @prompt.select("What would you like to do next?".yellow, %w(Quiz Compare Search Help About Exit))
    @answer = answer
  end

  def choose_menu_option(data)
    case self.answer
    when "Quiz"
    Help.quiz_help
    # run quiz help function to introduce quiz functionality
    # quiz_help
    # begin quiz to add user personality information to profile
    @user.personality_profile.quiz
    @user.personality_profile.generate_personality_map
    @user.generate_personality_type
    @user.generate_personality_temperament
    @user.temperament.give_personality_info
    @user.generate_occupation_suggestion(data)
    self.show_menu
    self.choose_menu_option(data)
     when "Compare"
      Help.compare_help
      begin 
      @jobs = get_occupation(data)
      rescue => e
        puts e.message
        retry
      end
      @answer = @prompt.select("By which metric which you like to compare these jobs?".yellow, %w(Salary Growth), 'Job Size', 'Vulnerability to Automation', 'Return to Main Menu')
      case @answer
      when "Salary"
        compare_occupation_salary(self.jobs)
        self.show_menu
        self.choose_menu_option(data)
      when "Growth"
        compare_occupation_growth(self.jobs)
        self.show_menu
        self.choose_menu_option(data)
      when "Job Size"
        compare_occupation_job_size(self.jobs)
        self.show_menu
        self.choose_menu_option(data)
      when 'Vulnerability to Automation'
        compare_occupation_automation_vulnerability(self.jobs)
        self.show_menu
        self.choose_menu_option(data)
      when 'Return to Main Menu'
        self.show_menu
        self.choose_menu_option(data)
      end
    when "Search"
      puts "placeholder3"
    when "Help"
      puts "placeholder4"
    when "About"
      puts "placeholder5"
    when "Exit"
      return
    end

  end
end