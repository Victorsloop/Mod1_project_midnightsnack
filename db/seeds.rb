require 'pry'
require 'rest-client' # let you actually make the requests to the URLs 
require 'json'
Snacker.destroy_all
Ingredient.destroy_all
FavoriteIngredient.destroy_all
EatenSnack.destroy_all

Ingredient.create(name: "eggs", quantity: 6.0, calories: 500)


def get_all_recipes
    page_number = 1
    100.times do 
        all_recipes = RestClient.get("http://www.recipepuppy.com/api/?i=&q=&p=#{page_number}")
        recipe_hash = JSON.parse(all_recipes)
        page_number += 1
        #binding.pry
    end
    binding.pry
    recipe_hash 
    #binding.pry
    puts "hello"
end

binding.pry
puts "hello"