class SocialMediaFeedsController < ApplicationController
  def index
    twitter_data = Rails.cache.read("twitter")
    facebook_data = Rails.cache.read("facebook")
    instagram_data = Rails.cache.read("instagram")

    while twitter_data.nil? || facebook_data.nil? || instagram_data.nil?
      # This should only happen when the app is first started
      # and has no data from the workers saved into temp files
      sleep 1
    end

    render json: {
      twitter: JSON.parse(twitter_data),
      facebook: JSON.parse(facebook_data),
      instagram: JSON.parse(instagram_data),
    }
  end
end
