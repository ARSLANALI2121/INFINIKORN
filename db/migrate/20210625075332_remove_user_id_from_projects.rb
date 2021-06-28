class RemoveUserIdFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :user_id, :integer
    add_column :projects, :client_id, :integer, null: false
  end
end
