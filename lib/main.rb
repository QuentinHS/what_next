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

