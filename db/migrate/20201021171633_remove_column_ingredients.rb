class RemoveColumnIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :eatensnack_id, :integer
  end
end
