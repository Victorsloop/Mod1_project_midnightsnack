require 'pry'
require 'tty-prompt'
class CLI 
    def welcome 
        font = TTY::Font.new(:doom)
        puts font.write ("Midnight Snack")
        #@@prompt = TTY::Prompt.new 
        #welcome = @@prompt.select("I see youre up for a midnight snack..again",active_color: :red) do |menu|
            #menu.choice 'Go through your fridge'
            #menu.choice 'Favorite Ingredients'
            #menu.choice 'hEaLtH'
            ##this should just display our app like the title and pic colors maybe
            ##meny called in seperate methods 
    
    end 

    def get_username
        puts "Here we go again.. right ? (y)/(n)"
        choice = gets.chomp
        if choice = "y"
            "Method to be created to retrieve username"
        elsif choice = "n"
            puts "Create user name method"
        else 
            puts "Please enter either y/n"
            get_username ##Method restarts since they did not enter yes or no
        end 
    end 



end #This is the end for the code 