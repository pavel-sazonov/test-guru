module ApplicationHelper
  def year
    Date.current.year
  end

  def github_url(project, author, repo)
    link_to project, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message
    flash.map do |name, msg|
      content_tag :p, msg, class: ['flash', name]
    end.join.html_safe
  end
end
