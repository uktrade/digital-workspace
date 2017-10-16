class Paginator
  PER_PAGE = 10

  def initialize(current_page, total_posts, total_pages)
    @current_page = current_page.to_i
    @total_pages = total_pages.to_i
    @total_posts = total_posts.to_i
  end

  def previous_page_no
    @current_page - 1 if @current_page > 1
  end

  def next_page_no
    @current_page + 1 if @current_page < @total_pages
  end
end
