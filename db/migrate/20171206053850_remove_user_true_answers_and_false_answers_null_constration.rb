class RemoveUserTrueAnswersAndFalseAnswersNullConstration < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:users, :true_answers, true)
    change_column_null(:users, :false_answers, true)
  end
end
