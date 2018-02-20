class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result
    if @test_passage.completed? && current_user.test_passages.count == 1
      current_user.add_badge('first test completed')
      flash.now[:notice] = 'You archive badge!'
    end

    if @test_passage.test_passed? && current_user.test_passages.where(correct_questions: 1).count == 1
      current_user.add_badge('first test passed')
      flash.now[:notice] = 'You archive badge!'
    end

    if current_user.passed_frontend_tests? && @test_passage.correct_questions == 1 && @test_passage.test.category_id == 1
      current_user.add_badge('all frontend tests passed')
      flash.now[:notice] = 'You archive badge!'
    end

    if current_user.passed_backend_tests? && @test_passage.correct_questions == 1 && @test_passage.test.category_id == 2
      current_user.add_badge('all backend tests passed')
      flash.now[:notice] = 'You archive badge!'
    end

    if current_user.passed_all_tests? && @test_passage.correct_questions == 1
      current_user.add_badge('all tests passed')
      flash.now[:notice] = 'You archive badge!'
    end
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    service = GistQuestionService.new(question)
    result = service.call

    flash_options =
      if service.success?
        current_user.gists.create(question: question, url: result.html_url)
        gist_link = view_context.link_to 'gist', result.html_url, target: :blank

        { notice: t('.success', gist_link: gist_link) }
      else
        { alert: t('.failure') }
      end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
