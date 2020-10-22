### Basically have to call out the favorites , and allow them to choose which ones to delte 
def display_faves(favorites)
    puts "These are all your favorite recipes"
    favorites.each_with_index do |fave, i|
      recipe = Recipe.find(fave.recipe_id)
      puts "#{i+1}. #{recipe.name}" ## Listing them down 
    end
    print "Which recipe would you like to remove from your favorites? "
    rec_num = gets.chomp.to_i
    puts
    recipe = Recipe.find(favorites[rec_num-1].recipe_id)
    print "Confirm deletion of #{recipe.name}? (y/n) "
     choice= gets.chomp
    if choice == "y"
      recipe
    else 
        display_menu 
    end
  end