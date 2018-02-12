module ApplicationHelper
  def year
    Date.current.year
  end

  def github_url(project, author, repo)
    link_to project, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(key)
    if key == 'notice'
      "alert alert-success"
    elsif key == 'alert'
      "alert alert-warning"
    else
      "alert alert-danger"
    end
  end
end
#
