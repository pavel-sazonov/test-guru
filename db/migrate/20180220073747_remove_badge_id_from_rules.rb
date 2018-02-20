class RemoveBadgeIdFromRules < ActiveRecord::Migration[5.1]
  def change
    remove_column :rules, :badge_id, :string
  end
end
