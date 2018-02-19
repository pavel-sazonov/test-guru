class ChangeUserBagesToUserBadges < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_bages, :user_badges
  end
end
