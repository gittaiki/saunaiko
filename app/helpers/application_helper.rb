module ApplicationHelper
  def title(youtube)
    youtube['title']
  end

  def author_name(youtube)
    youtube['author_name']
  end
end
