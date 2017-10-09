require 'httparty'

class PeopleFinder
  def profile
    # rubocop:disable all
    response = HTTParty.get(
      'https://peoplefinder-dev.herokuapp.com/api/people/?email=alice@example.com',
      headers: {
        'Authorization' => 'Token token=17bb94d536019d55d58753a4caff75eb96169cb3f2ff8df7e6736d137de08eef2e28e4b2799c87f622dce656acb2f209cfc929bdc1a574848abf32138de7c3d0'
      }
    )
    # rubocop:enable all
    JSON.parse(response.body)
  end
end
