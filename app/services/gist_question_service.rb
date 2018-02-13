class GistQuestionService
  ACESS_TOKEN = '06ca2a9edfb012387a4dd0612ff42952a11c7bbe'

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(access_token: ACESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('description', test_title: @test.title),
      files: {
        I18n.t('file_name') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
