class SocialMediaFeedsController < ApplicationController
  def index
    render json: {
      twitter: [],
      facebook: [],
      instagram: [],
    }
  end
end
