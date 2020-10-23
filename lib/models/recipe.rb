class Recipe < ActiveRecord::Base
    has_many :favorite_snacks
    has_many :snackers, through: :favorite_snacks
end

def add_favorite_snack(recipe)
    FavoriteSnack.create(snacker_id: snacker.id, recipe_id: self.id)
end