class SocialMediaFeedWorker
  include Sidekiq::Worker

  def perform
    response = HTTParty.get(endpoint_url)
    if response.code == 200
      file = File.open(file_path, 'w')
      file.puts(response.body)
    end
    self.class.perform_async
  end

  def endpoint_url
    # Overwrite me
  end

  def file_path
    # Overwrite me
  end
end
