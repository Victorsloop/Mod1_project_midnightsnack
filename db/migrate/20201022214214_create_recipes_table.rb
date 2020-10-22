class CreateRecipesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.integer :calories
    end
  end
end
