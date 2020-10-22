# require 'rubygems'
# require 'pry'

def search
  snack_ingredient = fridge_pantry
  snack_array = all_recipe(snack_ingredient)
  limit = recipe_limit(snack_array, snack_ingredient)
  snacker_recipes = view_recipes(snack_array, limit)
  choice = snack_menu 
  save_snack(snacker_recipes)
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

def snack_menu
  puts "Please choose one:"
  puts "1. Return to main menu"
  puts "2. Save a snack to favorites"
  choice = gets.chomp
  if choice == 1
    self.snacker_menu ## Returns to start
  if choice == 2 
    save_snack
  else   
    puts "Invalid choice!"
    true
  end
end

def favorites_has_recipe?(recipe)
  @snacker.favorite_snacks.each do |fave|
    if fave.recipe_id == recipe.id
      true
    end
  end
  false
end

      


# def add_favorite_snack(recipe)
#   FavoriteSnack.create(snacker_id: self.id, recipe_id: recipe.id)
# end

def save_snack(snacker_recipes)
  puts "Enter the number of the snack you'd like to save"
  snack_choice = gets.chomp
  recipe = snacker_recipes[snack_choice.to_i-1]
  if favorites_has_recipe?(recipe)
    puts "You've already saved this snack"
  else
    @snacker.add_favorite_snack(recipe)
  end
end

# def view_favorite_snacks
#     @snacker.favoritesnacks
# end

# binding.pry

# def add_favorite_snack(recipe)
#   FavoriteSnack.create(recipe_id: recipe.id, snacker_id: self.id)
# end





# def save_a_fave_snack(snacker_recipes, )
#   binding.pry
# end

      
      # def saved_favorites?(recipe)
      #   # checks favorites to make sure it hasn't been added yet
      #   username.favoritesnack.each do |fav|
      #     if fav.recipe_id == recipe.id
      #       return true
      #     end
      #   end
      #   false
      # end


      # def search
      #   snack_ingredient = fridge_pantry
      #   recipes = all_recipe
      #   snacker_recipes = view_recipes(all_recipe, limit)
      #   choices = recipe_menu
      #   recipe_menu
      #   display_menu 
      # end
      


end

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