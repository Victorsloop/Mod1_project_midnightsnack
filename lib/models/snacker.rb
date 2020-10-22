class Snacker < ActiveRecord::Base
    has_many :recipes, through: :favorite_snacks
    has_many :favorite_snacks

    def add_favorite_snack(recipe)
        FavoriteSnack.create(snacker_id: self.id, recipe_id: recipe.id)
    end
end