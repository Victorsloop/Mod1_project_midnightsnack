class Recipe < ActiveRecord::Base
    has_many :snackers, through: :ingredients
    has_many :ingredients
    has_many :eaten_snacks
end
