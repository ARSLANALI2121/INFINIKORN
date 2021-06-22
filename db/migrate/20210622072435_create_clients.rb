class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.integer :phone_number, limit: 8
      t.string :email

      t.timestamps
    end
  end
end
