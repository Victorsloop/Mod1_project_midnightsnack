require 'pry'
require 'tty-prompt'
class CLI 
    @@prompt = TTY::Prompt.new
    @@user = nil 
    def welcome 
        puts kitchen 
        font = TTY::Font.new(:starwars)
        pastel = Pastel.new
        puts pastel.blue(font.write ("Midnight Snack"))
            ##this should just display our app like the title and pic colors maybe
            ##meny called in seperate methods
    end 

    def get_username
        puts "Here we go again.. right ? (y)/(n)"
        choice = gets.chomp
        if choice == "y"
            username 
        elsif choice == "n"
            new_user 
        else 
            puts "Please enter either y/n"
            get_username ##Method restarts since they did not enter yes or no
        end 
    end 

    def username  ## Method for checking the name or a returning snacker
        puts "Please enter your name:"
        username = gets.chomp 
        user = Snacker.find_by(name: username)
        if user == nil 
            puts "We cant find that user "
        else 
            puts "Welcome back"
            return user 
        end 
    end 

    def new_user ##Creating and saving new snackers 
        puts "Whats your name:"
        name = gets.chomp 
        puts "Welcome to your midnight snack 🤫 "
        Snacker.create(name:name)
    end 

    def display_menu 
        @@prompt = TTY::Prompt.new 
        welcome = @@prompt.select("I see youre up for a midnight snack..again",active_color: :on_blue) do |menu|
            menu.choice 'Go through your fridge/pantry'
            menu.choice 'Favorite Recipies'
            menu.choice 'hEaLtH'
            menu.choice 'Delete Recipies'
        end 
        if welcome == 'Go through your fridge/pantry'
            puts "method 1"
        elsif welcome == 'Favorite Recipies'
            my_favorites
        elsif  welcome == 'hEaLtH'
            puts "Will count those calories"
        elsif welcome == 'Delete Recipies'
            puts "will delete them recipies "
        end 
    end
    
    def fridge_pantry
        puts "What ingredient did you find ? :"
        ingredient = gets.chomp
        Recipe.where(ingredients: ingredient).any?
    end


    def kitchen 
        ## Basically will be a textart that will be called in the front to make our image prettier 
        
    end 

   


        ##Here we will display our options to the snacker 
        ##choices = { "Search the fridge" => 1,
    #         "Search the pantry " => 2, 
    #         "Favorite recipies" => 3,
    #         "hEalTh" => 4,
    #         "Go to Sleep" => 5
    #     }
    # action = @@prompt.select("What would you like to do?", choices)
    #     case action
    #     when 1





end #This is the end for the code 
