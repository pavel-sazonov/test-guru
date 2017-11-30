class AddUserNameTrueAnswersFalseAnswersNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :true_answers, false)
    change_column_null(:users, :false_answers, false)
  end
end
