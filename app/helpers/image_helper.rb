module ImageHelper
  def large_image_tag(post)
    return unless post['acf'].present?

    image_tag post['acf']['image']['sizes']['large'],
              alt: post['title']['rendered']
  end

  def medium_image_tag(post)
    return unless post['acf'].present?
    image_tag post['acf']['image']['sizes']['medium'],
              alt: post['title']['rendered']
  end

  def small_image_tag(post)
    return unless post['acf'].present?

    image_tag post['acf']['image']['sizes']['small'],
              alt: post['title']['rendered']
  end
end
