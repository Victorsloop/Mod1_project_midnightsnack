require 'rubygems'
require 'recipe_puppy'

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
end