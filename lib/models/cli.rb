require 'pry'
require 'tty-prompt'
class CLI 

    attr_accessor :snacker, :recipe, :favoritesnack
    #@@prompt = TTY::Prompt.new
    #@@user = nil 

    def start
        welcome
        CLI.menu
    end

    private
    def welcome
        system("clear")
        puts creators
        puts "Youre back .. again ?"
        sleep(0.5)
        font = TTY::Font.new(:Doom)
        pastel = Pastel.new
        puts pastel.blue(font.write ("Midnight Snack"))
    end


    def self.menu
        prompt = TTY::Prompt.new
        sleep(1)
        display_menu = prompt.select ("Are you a returning snacker or is this your first time ? ") do |menu|
            menu.choice "Returning snacker"
            menu.choice "First timer"
            menu.choice "Go back to bed"
        end
        if display_menu == "Returning snacker"
            system("clear")
            CLI.login
        elsif display_menu == "First timer"
            system("clear")
            CLI.create_account
        elsif display_menu == "Go to bed"
            exit!
        end
    end


    def self.create_account
        prompt = TTY::Prompt.new
        username = prompt.ask("What is the snackers name ?")
        password = prompt.mask("Please choose a safe word")
        guest = Snacker.create(username: username, password: password)
        puts "Welcome to the midnight snack club:"
        sleep(1)
        @snacker = Snacker.all.find_by(username: username.downcase! , password: password)
        @snacker
        CLI.snacker_menu 
    end

    def self.login
        prompt = TTY::Prompt.new
        username = prompt.ask("Whats your name my snacking friend ?")
        password = prompt.mask("Magic word?")
        if Snacker.find_by(username: username, password: password)
            @snacker = Snacker.find_by(username: username, password: password)
            @snacker
         CLI.snacker_menu
        elsif
            system("clear")
            never_met_you = prompt.select("Username or Password not found.") do |menu|
                menu.choice "Log In"
                menu.choice "Create an Account"
                system("clear")
            end
         end 
         if never_met_you == "Log In"
             system("clear")
             CLI.login
         elsif never_met_you == "Create an Account"
             system("clear")
             CLI.create_account
         end
    end

    def self.go_to_bed
        prompt = TTY::Prompt.new
        @snacker = nil
        sleep(1.0)
        puts "Have a good night ."
        puts bed 
        prompt.keypress("\nPress r to return to main menu.", keys: [:"r", :return])
        CLI.menu
    end

    # Snacker menuuu
    def self.snacker_menu
        prompt = TTY::Prompt.new
        puts "Welcome back #{@snacker.username}!!!"
        select = prompt.select("What would you like to do?",active_color: :red) do |menu|
            menu.choice 'Go through your fridge/pantry'
            menu.choice 'Favorite Recipes'
            menu.choice 'hEaLtH'
            menu.choice 'Delete Recipes'
            menu.choice 'Go to bed..'
        end
        if select == "Go through your fridge/pantry"
            search
        elsif select == 'Favorite Recipes'
            view_my_favorites
         elsif  select  == 'hEaLtH'
            health
        elsif   select  == 'Delete Recipes'
            puts "will delete them recipes "
            get_recipe_to_delete
        elsif select == "Go to bed.."
            system("clear")
            CLI.go_to_bed
            exit!
        end
    end
end #This is the end for the code 
