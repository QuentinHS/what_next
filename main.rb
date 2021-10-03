require_relative 'classes/UserInterface'

# Create new interface, display introduction, create a new user, then show that user available options

interface = UserInterface.new
interface.intro
interface.create_user
interface.show_menu
interface.choose_menu_option('./occupation_data.json')

