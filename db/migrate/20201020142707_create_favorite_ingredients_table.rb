class CreateFavoriteIngredientsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_ingredients do |t|
      t.string :name
      t.float :quantity
      t.integer :calories
    end
  end
end
