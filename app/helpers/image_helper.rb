module ImageHelper
  def large_image_tag(post)
    return unless image_exists?(post)
    image_tag post['acf']['image']['sizes']['large'], alt: post['title']['rendered']
  end

  def medium_image_tag(post)
    return unless image_exists?(post)
    image_tag post['acf']['image']['sizes']['medium'], alt: post['title']['rendered']
  end

  def small_image_tag(post)
    return unless image_exists?(post)
    image_tag post['acf']['image']['sizes']['small'], alt: post['title']['rendered']
  end

  def image_exists?(obj)
    # inspect the object's type
    if obj.key?('acf')
      # it is a word press image then we know how to check it
      obj['acf'].present? && obj['acf']['image'] && obj['acf']['image']['sizes'].present?
    end
  end
end
