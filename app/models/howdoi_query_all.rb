# frozen_string_literal: true

class HowdoiQueryAll
  def howdois
    @howdois ||= begin
      offset = 0

      [].tap do |howdois|
        while (items = howdoi_query(offset)).count.positive?
          howdois.push(*items)
          offset += 100
        end
      end
    end
  end

  private

  def howdoi_query(offset)
    WpApi.get_json_body(
      'howdoi',
      params: { orderby: 'title', order: 'asc', per_page: 100, offset: offset }
    )
  end
end
