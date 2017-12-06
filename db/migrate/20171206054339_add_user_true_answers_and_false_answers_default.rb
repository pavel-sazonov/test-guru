class AddUserTrueAnswersAndFalseAnswersDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :true_answers, from: nil, to: 0)
    change_column_default(:users, :false_answers, from: nil, to: 0)
  end
end
