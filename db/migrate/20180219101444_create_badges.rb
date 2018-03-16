class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :file
      t.string :rule
      t.string :rule_value

      t.timestamps
    end
  end
end
