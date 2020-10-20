class CreateSnackersTable < ActiveRecord::Migration[6.0]
    def change
        create_table :snackers do |t|
            t.string :name
        end
    end
end
