# require 'rubygems'
# require 'pry'

def search
  snack_ingredient = fridge_pantry
  snack_array = all_recipe(snack_ingredient)
  limit = recipe_limit(snack_array, snack_ingredient)
  snacker_recipes = view_recipes(snack_array, limit)
  # choices = recipe_menu
  # recipe_menu
  # display_menu
end

def fridge_pantry
  puts "What did you find raiding the fridge and or pantry??? "
  snack_ingredient = gets.chomp
  #binding.pry
end
    # binding.pry
def all_recipe(snack_ingredient)
  # binding.pry
  snack_array = []
  Recipe.all.select do |recipe|
    recipe.ingredients.split(",").find do |ingredient|
      if ingredient.strip == snack_ingredient
        snack_array << recipe
      end
    end
  end
end

def recipe_limit(snack_array, snack_ingredient)
  if snack_array.empty?
    puts "Sorry, there are no snacks with #{snack_ingredient}"
    puts "Try another snack."
    search 
  end
  puts "There are #{snack_array.length} snacks with #{snack_ingredient} in them."
  puts "How many would you like to see?"
  snack_limit = gets.chomp
end

def view_recipes(snack_array, limit)
  puts "Here are your recipes!"
  snack_array[0...limit.to_i].each_with_index do |recipe, i|
    puts "#{i+1}. #{recipe.name}"
    puts "#{recipe.ingredients}"
  end
end
      
def recipe_menu
  puts "Please choose one:"
        puts "1. Return to main menu"
        puts "2. Save a recipe to favorites"
        choice = gets.chomp
        if  "1"
          false ## Returns to start
        elsif "2" 
            "saving to fav method"
          true
        else
          puts "Invalid choice!"
          true
        end
      end
      
      def saved_favorites?(recipe)
        # checks favorites to make sure it hasn't been added yet
        username.favoritesnack.each do |fav|
          if fav.recipe_id == recipe.id
            return true
          end
        end
        false
      end

      # def search
      #   snack_ingredient = fridge_pantry
      #   recipes = all_recipe
      #   snacker_recipes = view_recipes(all_recipe, limit)
      #   choices = recipe_menu
      #   recipe_menu
      #   display_menu 
      # end
      




# binding.pry


# def recipie_search
# end 

# Simple Search
# steakrecipes = RecipePuppy::Recipe.search_for("steak")
# steakrecipes.get['results'].each do |recipe|
#   puts recipe['title']
#   puts recipe['href']
#   puts recipe['ingredients']
#   puts recipe['thumbnail']
# end

# eggrecipes = RecipePuppy::Recipe.search_for("eggs, butter, salt")
# eggrecipes.get['results'].each do |recipe|
#      Recipe.create(
#        name: recipe['title']
#     puts recipe['ingredients']
#     # puts "What recipe would you like to save?"
#     # saved_recipe = gets.chomp
# end



