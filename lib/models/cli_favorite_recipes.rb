def my_favorites
    favorites = @snacker.favorite_snacks.reload 
  
    if favorites.empty?
      puts "You don't have any favorite recipies saved yet!"
      puts "Choose a different option"
      display_menu
    else
      puts "Here are your favorite recipes:"
      i = 1
      favorites.each do |fave|
        binding.pry
        puts "#{i}. #{fave}"
        i += 1
        sleep(0.5)
      end
      puts "Returning to main menu..."
      display_menu
    end
  
  end

  # def add_favorite_snack(recipe)
  #   fave_snack = FavoriteSnack.create(recipe_id: recipe.id, snacker_id: self.id)
  # end

