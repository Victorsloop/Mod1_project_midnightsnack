class Snacker < ActiveRecord::Base
    has_many :recipes, through: :favorite_snacks
    has_many :favorite_snacks
end