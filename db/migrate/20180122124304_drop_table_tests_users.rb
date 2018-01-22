class DropTableTestsUsers < ActiveRecord::Migration[5.1]
  def up
    drop_table :tests_users, if_exist: true
  end
end
