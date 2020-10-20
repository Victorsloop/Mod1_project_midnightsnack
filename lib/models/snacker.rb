class Snacker < ActiveRecord::Base
    has_many :favorite_ingredients
    has_many :eaten_snacks
    has_many :ingredients through :favorite_ingredients
end