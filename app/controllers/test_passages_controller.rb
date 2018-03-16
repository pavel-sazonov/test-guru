class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result
    user_badges_count = current_user.badges.count

    AwardWithBadges.new(@test_passage).call if @test_passage.correct?

    flash.now[:notice] = 'You have earned new badge!' if current_user.badges.count > user_badges_count
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      # TestsMailer.completed_test(@test_passage).deliver_now
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
