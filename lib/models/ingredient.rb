class Ingredient < ActiveRecord::Base
    has_many :snackers, through: :favorite_recipies
    has_many :favorite_recipies
    
end