class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACESS_TOKEN = '738d3f5eed8936bb091206d399792ac2b3a0ed7b'

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
