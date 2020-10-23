require 'pry'
require 'tty-prompt'

    def health 
    system("clear")
        font = TTY::Font.new(:Doom)
        pastel = Pastel.new
        puts pastel.red(font.write ("hEaLtH"))
        sleep(0.5)
        prompt = TTY::Prompt.new
        comfirmation = prompt.ask("Are you sure you want to know?...yes/no")
        if comfirmation == "yes"
           total_cal
        elsif comfirmation == "no"
            sleep(1.5)
            puts "Im sorry but you need to know"
            sleep(1.0)
            puts "same method you would recieve for saying yes"
        end 
    end ## end of that code 

    def total_cal
        weight =[]
        weight<< @snacker.favorite_snacks.calories.reload
        weight.map{|total|total.calorie}.sum
        if weight > 1400
            sleep(0.5)
            puts "Youre gaining weight you might have to slow down"
            puts "Youve exceeded the recomended amount for the day 🤯"
        elsif 
            weight < 800 
            puts "Youre playing a risky game, but treat yourself! 😳"
        end 
    end # End of the code 

    def gain ## Just funny methods we might use 
    end 

    def treat_your_self  ## another funny method we might use   
    end 