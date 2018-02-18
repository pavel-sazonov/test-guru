class AddNullFalseToFeedbackBody < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:feedbacks, :body, false)
  end
end
