require 'pry'
require 'tty-prompt'
class CLI 

    attr_accessor :snacker
    @@prompt = TTY::Prompt.new
    @@user = nil 

    def start
        welcome
        CLI.menu
    end

    private
    def welcome
        system("clear")
        puts "Youre back .. again ?"
        sleep(0.5)
        font = TTY::Font.new(:Doom)
        pastel = Pastel.new
        puts pastel.blue(font.write ("Midnight Snack"))
    end

# LOGIN MENU

    def self.menu
        prompt = TTY::Prompt.new
        sleep(1)
        display_menu = prompt.select ("Are you a returning snacker or is this your first time ? ") do |option|
            option.choice "Returning snacker"
            option.choice "First timer"
            option.choice "Go back to bed"
        end
        if display_menu == "Returning Snacker"
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
            CLI.display_menu
        elsif
            system("clear")
            missing_player = prompt.select("Username or Password not found.") do |option|
                option.choice "Log In"
                option.choice "Create an Account"
                system("clear")
            end
         end
        if missing_player == "Log In"
            system("clear")
            CLI.login
        elsif missing_player == "Create an Account"
            system("clear")
            CLI.create_account
        end
    end

    def self.go_to_bed
        prompt = TTY::Prompt.new
        @snacker = nil
        puts "Have a good night ."
        prompt.keypress("\nPress to return to main menu.", keys: [:space, :return])
        CLI.menu
    end

    # Snacker menuuu
    def self.sancker_menu
        prompt = TTY::Prompt.new
        puts "Welcome back #{@snacker}!!!"
        select = prompt.select("What would you like to do?") do |menu|
            menu.choice 'Go through your fridge/pantry'
            menu.choice 'Favorite Recipies'
            menu.choice 'hEaLtH'
            menu.choice 'Delete Recipies'
            menu.choice 'Go to bed..'
        end
        if select == "Go through your fridge/pantry"
            search
        elsif select == 'Favorite Recipies'
            my_favorites
        elsif  select  == 'hEaLtH'
            puts "Will count those calories"
        elsif   select  == 'Delete Recipies'
            puts "will delete them recipies "
        elsif select == "Log Out"
            system("clear")
            CLI.go_to_bed
        elsif select == "Go to bed.."
            exit!
        end
    end
end #This is the end for the code 
