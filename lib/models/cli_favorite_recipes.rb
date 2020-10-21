def my_favorites
    favorites = username.ingredient
  
    if favorites.empty?
      puts "You don't have any favorite recipies saved yet!"
      puts "Choose a different option"
      display_menu
    else
      puts "Here are your favorite recipes:"
      i = 1
      faves.each do |fave|
        puts "#{i}. #{fave.ingredients.name}"
        i += 1
        sleep(0.5)
      end
      puts "Returning to main menu..."
      display_menu
    end
  
  end