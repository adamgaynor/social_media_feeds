class SocialMediaFeedsController < ApplicationController
  def index
    twitter_data = read_tmp_file_data("twitter_response.json")
    facebook_data = read_tmp_file_data("facebook_response.json")
    instagram_data = read_tmp_file_data("instagram_response.json")

    while twitter_data.nil?# || facebook_data.nil? || instagram_data.nil?
      # This should only happen when the app is first started
      # and has no data from the workers saved into temp files
      sleep 1
    end

    render json: {
      twitter: twitter_data,
      facebook: facebook_data,
      instagram: instagram_data,
    }
  end

  def read_tmp_file_data(filename)
    return nil unless File.exists?("#{Rails.root}/tmp/#{filename}")
    begin
      JSON.parse(File.read("#{Rails.root}/tmp/#{filename}"))
    rescue => e
      []
    end
  end
end
