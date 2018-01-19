module QuestionsHelper

  def question_header(question)
    return "Create New #{question.test.title} Question" if question.new_record?
    "Edit #{question.test.title} Question"
  end
end
