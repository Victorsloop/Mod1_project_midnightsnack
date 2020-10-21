require 'pry'
require 'rest-client' # let you actually make the requests to the URLs 
require 'json'
Snacker.destroy_all
Ingredient.destroy_all
FavoriteIngredient.destroy_all
EatenSnack.destroy_all




def get_snacks
    page_number = 1
    snack_array = []
    1.times do 
        all_snacks = RestClient.get("http://www.recipepuppy.com/api/?i=&q=&p=#{page_number}")
        snack_hash = JSON.parse(all_snacks)
        page_number += 1
        # binding.pry
        snack_array << snack_hash["results"]
    end
    snack_array = snack_array.flatten

    #binding.pry

    snack_array.each do |snack|
        #binding.pry
        EatenSnack.create(
        name: snack["title"]
        )
        #binding.pry
    end
    snack_array.each do |snack|
        Ingredient.create(
            name: snack["ingredients"]
        )
    end
end


    
    # binding.pry
    puts "hello"
    puts "hello"
    # binding.pry



binding.pry
