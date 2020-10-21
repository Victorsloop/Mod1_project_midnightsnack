class ChangeTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :favorite_ingredients, :favorite_recipes
  end
end
