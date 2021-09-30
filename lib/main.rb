require "tty-prompt"
require 'colorize'
require "json"
require_relative "./classes/user"
require_relative './classes/occupation'
# require_relative 'classes/UserInterface'
require_relative './errors/invalid_input_error'
require_relative "./comparison"
require_relative './classes/UserInterface'



# Present welcome message to the user 

interface = UserInterface.new
interface.intro
interface.create_user
interface.show_menu
interface.choose_menu_option('./occupation_data.json')

# case interface.answer
# when "Quiz"
#   # run quiz help function to introduce quiz functionality
#   # interface.Help.quiz_help
#   # begin quiz to add user personality information to profile
#   interface.user.personality_profile.generate_personality_map
#   interface.user.personality_profile.quiz
#   interface.user.generate_personality_type
#   interface.user.generate_personality_temperament
#   interface.user.temperament.give_personality_info
#   interface.user.generate_occupation_suggestion('./occupation_data.json')
  
# when "Compare"
#   # interface.Help.compare_help
#   begin 
#   jobs = get_occupation("./occupation_data.json")
#   rescue => e
#     puts e.message
#     retry
#   end
  
#   answer = interface.prompt.select("By which metric which you like to compare these jobs?".yellow, %w(Salary Growth), 'Job Size', 'Vulnerability to Automation')
#   puts answer
#   case answer
#   when "Salary"
#     compare_occupation_salary(jobs)
#   when "Growth"
#     compare_occupation_growth(jobs)
#   when "Job Size"
#     compare_occupation_job_size(jobs)
#   when 'Vulnerability to Automation'
#     compare_occupation_automation_vulnerability(jobs)
#   end
  
# when "Search"
#   puts "placeholder3"
# when "Help"
#   puts "placeholder4"
# when "About"
#   puts "placeholder5"
# end