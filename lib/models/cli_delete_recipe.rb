# ### Basically have to call out the favorites , and allow them to choose which ones to delte 
def get_recipe_to_delete
  system("clear")
  puts dead
  font = TTY::Font.new(:Doom)
  pastel = Pastel.new
  puts pastel.cyan(font.write ("Deleting favs"))
  sleep(0.5)
  favorites = @snacker.favorite_snacks.reload
  # binding.pry
  fav_to_delete = display_faves(favorites)
  # binding.pry
  @snacker.delete_from_favorites(fav_to_delete)
  self.snacker_menu
end


def display_faves(favorites)
  puts "Here are your favorite snacks:"
  favorites = @snacker.favorite_snacks.reload
  favorites.each_with_index do |fave, i|
    recipe = Recipe.find(fave.recipe_id)
    puts "#{i+1}. #{recipe.name}"
  end
  puts "Which recipe would you like to remove from favorites? "
  rec_num = gets.chomp.to_i
  recipe = Recipe.find(favorites[rec_num-1].recipe_id)
end