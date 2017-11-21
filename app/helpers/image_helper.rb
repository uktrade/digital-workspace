module ImageHelper
  def large_image_tag(post)
    return unless image_exists?(post)
    if alt_exists?(post)
      (img_alt = post['acf']['image']['alt'].html_safe)
    else
      (img_alt = post['title']['rendered'].html_safe)
    end
    image_tag post['acf']['image']['sizes']['large'], alt: img_alt
  end

  def medium_image_tag(post)
    return unless image_exists?(post)
    if alt_exists?(post)
      (img_alt = post['acf']['image']['alt'].html_safe)
    else
      (img_alt = post['title']['rendered'].html_safe)
    end
    image_tag post['acf']['image']['sizes']['medium'], alt: img_alt
  end

  def small_image_tag(post)
    return unless image_exists?(post)
    if alt_exists?(post)
      (img_alt = post['acf']['image']['alt'].html_safe)
    else
      (img_alt = post['title']['rendered'].html_safe)
    end
    image_tag post['acf']['image']['sizes']['small'], alt: img_alt
  end

  def image_exists?(obj)
    # inspect the object's type
    if obj.key?('acf')
      # it is a word press image then we know how to check it
      obj['acf'].present? && obj['acf']['image'] && obj['acf']['image']['sizes'].present?
    end
  end

  def alt_exists?(obj)
    if obj.key?('acf')
      # it is a word press image then we know how to check it
      obj['acf'].present? && obj['acf']['image'] && obj['acf']['image']['alt'].present?
    end
  end
end
