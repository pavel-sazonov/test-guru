class RemoveForeighKeyFromTestPassages < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :test_passages, column: :current_question_id
  end
end
