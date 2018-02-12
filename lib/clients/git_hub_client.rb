class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACESS_TOKEN = '2bd9e02ad5f28c9ab007f743a0b8b862afb9ab71'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authtorization'] = "token #{ACESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
