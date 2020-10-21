class Ingredient < ActiveRecord::Base
    has_many :snackers, through: :favorite_recipes
    has_many :favorite_recipes
    belongs_to :eaten_snacks
    
end