module ApplicationHelper
  def page_title
    title = "PayTemporarily"
    title = @page_title + " | " + title if @page_title
    title
  end
end
