require 'pry'
require 'tty-prompt'
class CLI 
    @@prompt = TTY::Prompt.new
    @@user = nil 
    def welcome 
        puts kitchen 
        font = TTY::Font.new(:Doom)
        pastel = Pastel.new
        puts pastel.blue(font.write ("Midnight Snack"))
            ##this should just display our app like the title and pic colors maybe
            ##meny called in seperate methods
    end 

    def get_username
        puts "You've been here before.. right ? (y)/(n)"
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
        puts "Whats your name ? "
        username = gets.chomp 
        user = Snacker.find_by(name: username)
        if user == nil 
            nil_user 
        else 
            puts "Welcome back #{Snacker.name}!!!!"
            return user 
        end 
    end 

    def new_user ##Creating and saving new snackers 
        puts "Lets make you an account ,whats your name?"
        name = gets.chomp 
        username_taken(name)
        puts "Welcome to your midnight snack 🤫 "
        Snacker.create(name:name)
    end 

    def nil_user 
        puts "I dont believe we have met before, how about we"
        puts "1.Search again"
        puts "2.Create an acconut for you "
        choice = gets.chomp 
        if choice == "1"
            username 
        elsif choice == "2"
            new_user 
        else 
            puts "Your options are either 1 or 2"
        end 
    end 

    def username_taken(name)
        if Snacker.find_by(name: name) != nil
            puts "This account already exists"
            puts "Are you.. 1.sure about this name or would you like to 2.create a new one ?"
            choice = gets.chomp 
            if choice == "1"
                print "Here we go again #{name}"
                return Snacker.find_by(name:name)
            elsif 
                choice == "2"
                new_user
            else 
                puts "Sorry but those are your only two choices"
                username 
            end 
        end 
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
            search
        elsif welcome == 'Favorite Recipies'
            my_favorites
        elsif  welcome == 'hEaLtH'
            puts "Will count those calories"
        elsif welcome == 'Delete Recipies'
            puts "will delete them recipies "
        end 
    end
    
    def recipe_search
        snack_ingredient = fridge_pantry
        snack_array = all_recipe(snack_ingredient)
    end

    # def fridge_pantry
    #     puts "What ingredient did you find ? :"
    #     snack_ingredient = gets.chomp
    # end

    # def all_recipe(snack_ingredient)
    #     snack_array = []
    #     Recipe.all.select do |recipe|
    #         recipe.ingredients.split(",").find do |ingredient|
    #             if ingredient.strip == snack_ingredient
    #                 snack_array << recipe
    #             end
    #         end
    #     end
    # end




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




 #This is the end for the code 
end