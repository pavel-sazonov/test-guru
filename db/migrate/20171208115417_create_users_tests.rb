class CreateUsersTests < ActiveRecord::Migration[5.1]
  def change
    create_table :users_tests do |t|
      t.integer :user_id
      t.integer :test_id

      t.timestamps
    end
  end
end
