class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :true_answers
      t.integer :false_answers

      t.timestamps
    end
  end
end
