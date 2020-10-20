class Ingredient < ActiveRecord::Base
    has_many :favorite_ingredients
    has_many :snackers through :favorite_ingredients
end