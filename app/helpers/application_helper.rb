module ApplicationHelper
  def title(page_title)
    title = page_title.empty? ? "Ladies dress gents" : page_title
    content_for(:title){ "LDG | #{title}" }
  end
end
