class Snacker < ActiveRecord::Base
    has_many :favorite_recipies
    has_many :eaten_snacks
    has_many :ingredients, through: :favorite_recipies
end