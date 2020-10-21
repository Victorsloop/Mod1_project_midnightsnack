require 'rubygems'
require 'recipe_puppy'


def fridge_pantry
    puts "What ingredient did you find ? :"
  ingredient = gets.chomp
end 


def recipie_search
end 

# Simple Search
# steakrecipes = RecipePuppy::Recipe.search_for("steak")
# steakrecipes.get['results'].each do |recipe|
#   puts recipe['title']
#   puts recipe['href']
#   puts recipe['ingredients']
#   puts recipe['thumbnail']
# end

eggrecipes = RecipePuppy::Recipe.search_for("eggs, butter, salt")
eggrecipes.get['results'].each do |recipe|
    puts recipe['title']
    puts recipe['ingredients']
    puts "What recipe would you like to save?"
    saved_recipe = gets.chomp
end
