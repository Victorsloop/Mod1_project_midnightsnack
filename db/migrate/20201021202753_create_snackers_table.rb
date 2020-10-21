class CreateSnackersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :snackers do |t|
      t.string :name
      t.string :username
      t.string :password
    end
  end
end
