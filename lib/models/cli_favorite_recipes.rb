def view_my_favorites
  fav = @snacker.favorite_snacks.reload
  if fav.empty?
    puts "You don't have any favorite recipies saved yet!"
    puts "Choose a different option"
    self.snacker_menu
  else
    puts "Here are your favorite recipes:"
    i = 1
    fav.each do |fave|
      puts "#{i}. #{fave.name}"
      i += 1
      sleep(0.5)
    end
    puts "Returning to main menu..."
    self.snacker_menu
  end
end

  # def add_favorite_snack(recipe)
  #   fave_snack = FavoriteSnack.create(recipe_id: recipe.id, snacker_id: self.id)
  # end

