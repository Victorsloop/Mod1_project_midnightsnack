require_relative '../config/environment'
#require_relative 'Users/victor/Flatiron/Mod1a/ruby-project-guidelines/lib/models/cli.rb'
require 'pry'


puts "HELLO WORLD"
cli = CLI.new
cli.welcome 
cli.get_username 
cli.display_menu 
cli.new_user
cli.fridge_pantry
binding.pry

