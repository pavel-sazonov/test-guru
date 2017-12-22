class RemoveIndexFromTestsUser < ActiveRecord::Migration[5.1]
  def change
    remove_index :tests_users, column: [:user_id, :test_id]
  end
end
