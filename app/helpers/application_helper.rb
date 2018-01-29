module ApplicationHelper
  def year
    Date.current.year
  end

  def github_url(project, author, repo)
    link_to project, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(message)
    content_tag :p, flash[message], class: "flash #{message}" if flash[message]
  end
end
