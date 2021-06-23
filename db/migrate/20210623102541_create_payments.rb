class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 7, scale: 2
      t.string :currency
      t.string :bank_name
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
