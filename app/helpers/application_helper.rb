module ApplicationHelper
  FLASH_TYPE = { 'notice' => 'success', 'alert' => 'warning' }.freeze

  def year
    Date.current.year
  end

  def github_url(project, author, repo)
    link_to project, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(key)
    css_class = FLASH_TYPE[key] || 'danger'
    "alert alert-#{css_class}"
  end
end
