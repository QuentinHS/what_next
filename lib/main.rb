require_relative 'classes/UserInterface'

# Present welcome message to the user 

interface = UserInterface.new
interface.intro
interface.create_user
interface.show_menu
interface.choose_menu_option('./occupation_data.json')

