class Ingredient < ActiveRecord::Base
    belongs_to :recipes
    belongs_to :snackers
end

