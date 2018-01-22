class DropTableUsersTests < ActiveRecord::Migration[5.1]
  def up
    drop_table :users_tests, if_exist: true
  end
end
