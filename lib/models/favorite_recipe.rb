class FavoriteRecipe < ActiveRecord::Base
    belongs_to :ingredients
    belongs_to :snackers
end