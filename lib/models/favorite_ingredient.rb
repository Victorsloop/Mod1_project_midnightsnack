class FavoriteIngredient < ActiveRecord::Base
    belongs_to :ingredients
    belongs_to :snackers
end