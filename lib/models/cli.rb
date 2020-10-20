require 'pry'
require 'tty-prompt'
class CLI 
    ##This was just a dummy to see if it would run. We can decide what to name it and go forth
    def welcome 
        @@prompt = TTY::Prompt.new 
        welcome = prompt.select("I see youre up for a midnight snack..again",active_color: :red) do |menu|
            menu.choice 'Go through your fridge'
            menu.choice 'Favorite Ingredients'
            menu.choice 'hEaLtH'
        end 
    end 


end #This is the end for the code 