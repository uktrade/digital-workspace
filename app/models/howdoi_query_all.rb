# frozen_string_literal: true

class HowdoiQueryAll
  def howdois
    return @howdois if @howdois

    @howdois = []

    offset = 0
    while (items = howdoi_query(offset)).count == 100
      @howdois.push(*items)
      offset += 100
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
