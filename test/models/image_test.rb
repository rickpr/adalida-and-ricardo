require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess
  test '#raw_service_url' do
    image = Image.new
    image.image = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    assert_match(
      /http:\/\/test\.fake\/rails\/active_storage\/blobs\/[^\/]+\/apple-touch-icon.png$/,
      image.raw_service_url
    )
  end
end
