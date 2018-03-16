class CreateUserBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :user_badges do |t|
      t.references :user
      t.references :badge
    end
  end
end
