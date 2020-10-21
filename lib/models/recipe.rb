class Recipe < ActiveRecord::Base
    has_many :snackers, through: :ingredients
    has_many :ingredients
    belongs_to :eaten_snacks
end
