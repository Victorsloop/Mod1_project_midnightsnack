class RemoveColumnsFromIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :quantity, :float
    remove_column :ingredients, :calories, :integer
  end
end
