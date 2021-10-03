require 'tty-prompt'
require 'colorize'
require 'json'
require_relative './user'
require_relative './occupation'
require_relative '../errors/invalid_input_error'
require_relative '../modules/help'
require_relative '../modules/search'
require_relative '../modules/occupation_data'
require_relative '../modules/compare_occupations'

class UserInterface
  attr_accessor :user, :prompt, :answer, :jobs
  include Help
  include Search

  # intialize user interface for the application
  def initialize
    @user = nil
    # Create new prompt
    @prompt = TTY::Prompt.new
    @answer = nil
    @jobs = nil
  end

  # introduce the application to user
  def intro
    puts "Welcome to 'What Next?', a terminal-based application to help you decide on your future career path!".green 
   
  end

  # create a new user with the name from user input
  def create_user
  
    # Ask user for name input
    name = @prompt.ask("Can we start with your name? You can just press 'enter' to remain anonymous.".magenta, default: "anonymous").strip.capitalize
    # Create new user object with name parameter 
    @user = User.new(name)

    # display further introduction to user
    puts "Hi #{self.user.name}! If you're feeling a bit lost, you're welcome to take a short quiz that will hopefully give you a few helpful suggestions. If you already know your personality type (say you've done a Myer-Briggs or Keirsey-style test before), you can also search for jobs that might suit your personality type. Or you can just compare two career options directly.".cyan
  end

  # display menu options to user
  def show_menu
    # Ask user which option they want to select
    answer = @prompt.select("What would you like to do next?".yellow, %w(Quiz Compare Search Help Exit))
    @answer = answer
  end

  # run application function depending on user selection
  def choose_menu_option(data)
    case self.answer
    when "Quiz"
    # run quiz help function to introduce quiz functionality
    Help.quiz_help

  
    # begin quiz to add user personality information to profile. Make sure valid data is being returned using begin|rescue block
    begin
    @user.personality_profile.quiz
    @user.personality_profile.generate_personality_map
    @user.generate_personality_type
    @user.generate_personality_temperament
    @user.temperament.give_personality_info
    @user.generate_occupation_suggestion(data)
    self.reset_interface
    self.show_menu
    self.choose_menu_option(data)

    # If an error is raised, return to the main menu
    rescue
      self.show_menu
      self.choose_menu_option(data)
    end

    # run comparison function when that option is selected
    when "Compare"
    Help.compare_help
    # attempt to load json data, throw error if this fails
    begin 
    input = CompareOccupations.get_input(data)
    @jobs = CompareOccupations.get_occupation(data, input[:first_occupation], input[:second_occupation])
    @answer = @prompt.select("By which metric which you like to compare these jobs?".yellow, %w(Salary Growth), 'Job Size', 'Vulnerability to Automation', 'Return to Main Menu')
    # return to main menu if "-q" or "--quit" options are selected
    rescue QuitError => e
      self.show_menu
      self.choose_menu_option(data)
    rescue InvalidInputError => e
      puts e.message
      retry
    end

    # based on metric chosen by user, run comparison function
    case @answer
    when "Salary"
      CompareOccupations.compare_occupation_salary(self.jobs)
      self.show_menu
      self.choose_menu_option(data)
    when "Growth"
      CompareOccupations.compare_occupation_growth(self.jobs)
      self.show_menu
      self.choose_menu_option(data)
    when "Job Size"
      CompareOccupations.compare_occupation_job_size(self.jobs)
      self.show_menu
      self.choose_menu_option(data)
    when 'Vulnerability to Automation'
      CompareOccupations.compare_occupation_automation_vulnerability(self.jobs)
      self.show_menu
      self.choose_menu_option(data)
    when 'Return to Main Menu'
      self.show_menu
      self.choose_menu_option(data)
    end
    # run search function if that option is chossen by user
    when "Search"
      # run help function for search option
      Help.search_help
      @answer = @prompt.select("What is your personality type?".yellow, 'Return to Main Menu', %w(ISTJ ISTP ISFJ ISFP INFJ INFP INTJ INTP ESTP ESTJ ESFP ESFJ ENFP ENFJ ENTP ENTJ))
      if @answer == 'Return to Main Menu'
        self.show_menu
        self.choose_menu_option(data)
      else 
        @jobs = OccupationData.load_occupation_data(data)
        job_list = Search.retrieve_jobs_by_personality(@answer, @jobs)
        Search.display_suitable_jobs(@answer, job_list)
        self.show_menu
        self.choose_menu_option(data)
      end
    when "Help"
      Help.main_help
      self.show_menu
      self.choose_menu_option(data)
    when "Exit"
      return
    end
  end
  
  # reset interface if necessary
  def reset_interface
    @user.personality_type = nil
    @user.personality_profile.quiz_answers = []
    @user.temperament = nil
  end

end