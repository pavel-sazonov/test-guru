class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, except: [:new, :create]
  before_action :find_test_by_question, only: [:show, :edit, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_resource_not_found

  # def index
  #   @questions = Questions.all
  # end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = @test.questions.create(question_params)

    if @question.persisted?
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to test_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test_by_question
    @test = @question.test
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
