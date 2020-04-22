class SocialMediaFeedWorker
  include Sidekiq::Worker

  def perform
    response = HTTParty.get(endpoint_url)
    if response.code == 200
      Rails.cache.write(cache_key, response.body)
    end
    self.class.perform_async
  end

  def endpoint_url
    # Overwrite me
  end

  def cache_key
    # Overwrite me
  end
end
