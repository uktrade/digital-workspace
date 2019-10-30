# frozen_string_literal: true

class WpResponse
  def initialize(raw_response)
    @raw_response = raw_response
  end

  def to_json(*_args)
    JSON.parse(response_body_with_proxy_urls)
  rescue JSON::ParserError => e
    # Provide extra information to aid in debugging
    Raven.capture_exception(
      e,
      extra: {
        request_url: raw_response.effective_url,
        response_code: raw_response.response_code
      }
    )
  end

  private

  attr_reader :raw_response

  def response_body_with_proxy_urls
    # TODO: This is temporary (famous last words)
    #
    # At the moment, the Wordpress response includes generated signed S3 URLs for all
    # assets. These expire after 15 minutes, which means that:
    #   a) If a user has a page open for more than 15 minutes, all links to documents
    #      simply stop working, and
    #   b) Video streaming doesn't work for videos > 15 minutes in length
    #
    # We now have an asset streaming proxy that takes care of authenticating a user
    # and then sending data their way, so we no longer want to surface raw S3 URLs
    # to users. Until we bring Wordpress in-house, we have no way of transforming the
    # asset links "at source", so we have to resort to this ugly hack of running a
    # "search and replace" on every Wordpress response to replace any occurrences of
    # signed S3 URLs with the equivalent URL on our asset proxy.

    if replace_s3_urls_with_proxy_urls?
      response_body.gsub(s3_asset_bucket_url, s3_asset_proxy_url)
    else
      response_body
    end
  end

  def s3_asset_proxy_url
    return unless ENV['S3_ASSET_PROXY_URL'].present?

    # Forward slashes are escaped in JSON response
    ENV['S3_ASSET_PROXY_URL'].gsub('/', '\/')
  end

  def s3_asset_bucket_url
    return unless ENV['S3_ASSET_BUCKET_URL'].present?

    # Forward slashes are escaped in JSON response
    ENV['S3_ASSET_BUCKET_URL'].gsub('/', '\/')
  end

  def replace_s3_urls_with_proxy_urls?
    s3_asset_proxy_url.present?
  end

  def response_body
    raw_response.body
  end
end
