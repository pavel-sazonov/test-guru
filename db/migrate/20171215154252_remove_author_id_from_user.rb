class RemoveAuthorIdFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :author_id, :integer
  end
end
