class HomeController < ApplicationController
  def index
  end

  def update_build
    if update_netlify_build!
      render inline: 'alert("Build succeeded")'
    else
      render inline: 'alert("Build failed")'
    end
  end

  private

  def update_netlify_build!
    build_url = Rails.application.credentials[:netlify_build_url]
    return false unless build_url.present?

    uri = URI(build_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    begin
      http.request(Net::HTTP::Post.new(uri.path)).code == '200'
    rescue StandardError
      false
    end
  end
end
