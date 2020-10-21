class Snacker < ActiveRecord::Base
    has_many :favorite_recipes
    has_many :eaten_snacks
    has_many :ingredients, through: :favorite_recipes
end