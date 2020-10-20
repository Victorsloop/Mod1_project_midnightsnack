require 'pry'
require 'rest-client' # let you actually make the requests to the URLs 
require 'json'
Snacker.destroy_all
Ingredient.destroy_all
FavoriteIngredient.destroy_all
EatenSnack.destroy_all



#just testing out this recipe puppy link because the spoonacular one is saying {"status":"failure", "code":401,"message":"You are not authorized. Please read https://spoonacular.com/food-api/docs#Authentication"}
api_response = RestClient.get("http://www.recipepuppy.com/api/?") #https://api.spoonacular.com/recipes/complexSearch
api_data = JSON.parse(api_response)
 
binding.pry 
### Yea i was trying to reach out to the mod2 students who used sppontacular but it looks
# like this one atleast works and well 
##when i use count on api_data it only gives me 4 which is weird 
snacker.create(username:"Sean", password: "11111")