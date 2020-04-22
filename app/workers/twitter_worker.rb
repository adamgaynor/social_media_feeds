class TwitterWorker < SocialMediaFeedWorker
  include Sidekiq::Worker

  def endpoint_url
    'https://takehome.io/twitter'
  end

  def cache_key
    'twitter'
  end
end
