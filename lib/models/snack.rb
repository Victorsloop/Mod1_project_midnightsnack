class EatenSnack < ActiveRecord::Base
    belongs_to :snackers
    has_many :ingredients
end