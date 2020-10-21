class Snacker < ActiveRecord::Base
    has_many :eaten_snacks, through: :recipes
    has_many :recipes, through: :ingredients
    has_many :ingredients
end