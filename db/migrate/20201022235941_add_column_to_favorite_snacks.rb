class AddColumnToFavoriteSnacks < ActiveRecord::Migration[6.0]
  def change
    add_column :favorite_snacks, :name, :string
  end
end
