class InstagramWorker < SocialMediaFeedWorker
  include Sidekiq::Worker

  def endpoint_url
    'https://takehome.io/instagram'
  end

  def cache_key
    'instagram'
  end
end
