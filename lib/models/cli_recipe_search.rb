def search
  system("clear")
  font = TTY::Font.new(:Doom)
  pastel = Pastel.new
  puts pastel.yellow(font.write ("Searching....."))
  sleep(0.5)
  snack_ingredient = fridge_pantry
  snack_array = all_recipe(snack_ingredient)
  limit = recipe_limit(snack_array, snack_ingredient)
  snacker_recipes = view_recipes(snack_array, limit)
  choice = snack_menu 
  save_snack(snacker_recipes)
  self.snacker_menu
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
    puts "Sorry, there are no recipes with #{snack_ingredient}"
    puts "Look around some more."
    self.snacker_menu 
  end
  puts "There are #{snack_array.length} recipes with #{snack_ingredient} in them."
  puts "How many would you like to see?"
  snack_limit = gets.chomp
end

def view_recipes(snack_array, limit)
  puts "Here are your recipes!"
  snack_array[0...limit.to_i].each_with_index do |recipe, i|
    sleep(1.0)
    puts "#{i+1}. #{recipe.name}"
    puts "#{recipe.ingredients}"
  end
end

def snack_menu
  puts "Please choose one:"
  puts "1. Return to main menu"
  puts "2. Save a recipe to favorites"
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
  @snacker.favorite_snacks.select do |fave|
    if fave.recipe_id == recipe.id
      true
    end
  end
  false
end

def save_snack(snacker_recipes)
  puts "Enter the number of the recipe you'd like to save"
  snack_choice = gets.chomp
  recipe = snacker_recipes[snack_choice.to_i-1]
  if favorites_has_recipe?(recipe)
    puts
    puts "You've already saved this recipe!"
  else
    @snacker.add_favorite_snack(recipe)
    @snacker.favorite_snacks.reload
  end
end

end
