class Ingredient < ActiveRecord::Base
    has_many :snackers, through: :favorite_ingredients
    has_many :favorite_ingredients
    belongs_to :eaten_snacks
    
end