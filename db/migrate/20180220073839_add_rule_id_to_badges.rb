class AddRuleIdToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :rule_id, :integer
  end
end
