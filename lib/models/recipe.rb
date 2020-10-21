class Recipe < ActiveRecord::Base
    has_many :snackers, through: :favorite_snacks
    has_many :favorite_snacks
end
