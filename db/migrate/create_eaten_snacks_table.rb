class CreateEatenSnacksTable < ActiveRecord::Migration[6.0]
    def change
        create_table :eaten_snacks do |t|
            t.string :name
            t.integer :calories
            t.text :ingredients
        end
    end
end
