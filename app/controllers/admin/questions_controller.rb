class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[create new]
  before_action :find_question, except: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_resource_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def edit; end

  def create
    @question = @test.questions.create(question_params)

    if @question.persisted?
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_test_path(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
