require 'pry'
require 'rest-client' # let you actually make the requests to the URLs 
require 'json'
Snacker.destory_all
Ingredient.destory_all
FavoriteIngredient.destory_all
EatenSnack.destory_all




api_response = RestClient.get(##whichever is the best)
api_data = JSON.parse(api_response)
 
binding.pry 

snacker.create(username:"Sean", password: "11111")