class DeleteColumnsFromEatenSnacks < ActiveRecord::Migration[6.0]
  def change
    remove_column :eaten_snacks, :calories, :integer
    remove_column :eaten_snacks, :ingredients, :text
  end
end
