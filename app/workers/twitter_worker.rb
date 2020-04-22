class TwitterWorker < SocialMediaFeedWorker
  include Sidekiq::Worker

  def endpoint_url
    'https://takehome.io/twitter'
  end

  def file_path
    "#{Rails.root}/tmp/twitter_response.json"
  end
end
