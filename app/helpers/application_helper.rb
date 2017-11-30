module ApplicationHelper
  def parsed_tweet(tweet)
    TweetParser.new(tweet).parse.html_safe
  end

  def truncate_home_news_title(text)
    html_text = truncate(text, length: 65, omission: ' &hellip;', escape: false)
    strip_tags(html_text)
  end

  def truncate_excerpt_hero(text)
    html_text = truncate(text, length: 200, omission: ' ...', escape: false)
    strip_tags(html_text)
  end

  def truncate_excerpt_home_news(text)
    html_text = truncate(text, length: 100, omission: ' ...', escape: false)
    strip_tags(html_text)
  end

  def truncate_excerpt(text)
    html_text = truncate(text, length: 200, omission: ' ...', escape: false)
    strip_tags(html_text)
  end

  def read_more(link)
    link_to('Read more', link, class: 'cta-read-more')
  end

  def comments(link, count)
    return if count.zero?
    text = count == 1 ? 'comment' : 'comments'
    link_to("#{count} #{text}", link + '#comments', class: 'cta-comments')
  end

  def comments_heading(count)
    return if count.zero?
    text = count == 1 ? 'comment' : 'comments'
    "#{count} #{text}"
  end

  def page_title
    (
      [@page_title] << 'Digital Workspace'
    ).compact.join(' - ').html_safe
  end
end
