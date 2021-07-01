class AddProjectIdToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :project_id, :integer
  end
end
