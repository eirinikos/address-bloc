

require_relative "controllers/menu_controller"


menu = MenuController.new
# create a new menu controller when AddressBloc starts.

system "clear"
# clear the command line.

puts "Welcome to AddressBloc!"

menu.main_menu
# call main_menu to display the menu