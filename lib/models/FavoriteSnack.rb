class FavoriteSnack < ActiveRecord::Base
    belongs_to :snackers
    belongs_to :recipes
end