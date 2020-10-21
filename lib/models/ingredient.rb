class Ingredient < ActiveRecord::Base
<<<<<<< HEAD
    has_many :snackers, through: :favorite_recipies
    has_many :favorite_recipies
=======
    has_many :snackers, through: :favorite_ingredients
    has_many :favorite_ingredients
    belongs_to :eaten_snacks
>>>>>>> 251f9efc32b7981dc4953a8a5baf59b077d3197e
    
end