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
        weight = @snacker.favorite_snacks.reload
        weight.each_with_index do |fave, i|
            recipe = Recipe.find(fave.recipe_id)
            puts "#{i+1}. #{recipe.name} #{recipe.calories}"
        end
        self.snacker_menu
    end

    #         if calorie_array.sum > 1400
    #             sleep(0.5)
    #             puts "Youre gaining weight you might have to slow down"
    #             puts "Youve exceeded the recomended amount for the day 🤯"
    #         elsif 
    #             calorie_array.sum < 800 
    #             puts "Youre playing a risky game, but treat yourself! 😳"
    #         end
    #     end # End of the code 
    # end


    def gain ## Just funny methods we might use 
    end 

    def treat_your_self  ## another funny method we might use   
    end 

    # def get_favorite_calories(favorites)
    #     favorites = @snacker.favorite_snacks.reload
    #     favorites.each_with_index do |fave, i|
    #       recipe = Recipe.find(fave.recipe_id)
    #       binding.pry 
    #     end
    #     puts "Which recipe would you like to remove from favorites? "
    #     rec_num = gets.chomp.to_i
    #     recipe = Recipe.find(favorites[rec_num-1].recipe_id)
    #   end