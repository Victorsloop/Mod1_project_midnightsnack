class Snacker < ActiveRecord::Base
    has_many :recipes
    has_many :eaten_snacks
    has_many :ingredients, through: :recipes
end