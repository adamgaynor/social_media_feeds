class FacebookWorker < SocialMediaFeedWorker
  include Sidekiq::Worker

  def endpoint_url
    'https://takehome.io/facebook'
  end

  def cache_key
    'facebook'
  end
end
