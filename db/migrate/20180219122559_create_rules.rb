class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.string :body
      t.references :badge, foreign_key: true

      t.timestamps
    end
  end
end
