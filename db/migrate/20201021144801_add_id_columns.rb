class AddIdColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :eatensnack_id, :integer
  end
end
