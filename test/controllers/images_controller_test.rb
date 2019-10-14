require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carousel = carousels(:one)
    @image = images(:one)
  end

  test "should get index" do
    get carousel_images_url(@carousel)
    assert_response :success
  end

  test "should get new" do
    get new_carousel_image_url(@carousel)
    assert_response :success
  end

  test "should create image" do
    assert_difference('Image.count') do
      post carousel_images_url(@carousel), params: {
        image: {
          alt_text: @image.alt_text,
          container_id: @image.container_id,
          container_type: @image.container_type,
          description: @image.description,
          name: @image.name 
        } 
      }
    end

    assert_redirected_to carousel_image_url(@carousel, Image.last)
  end

  test "should show image" do
    get carousel_image_url(@carousel, @image)
    assert_response :success
  end

  test "should get edit" do
    get edit_carousel_image_url(@carousel, @image)
    assert_response :success
  end

  test "should update image" do
    patch carousel_image_url(@carousel, @image), params: {
      image: {
        alt_text: @image.alt_text,
        container_id: @image.container_id,
        container_type: @image.container_type,
        description: @image.description,
        name: @image.name
      }
    }
    assert_redirected_to carousel_image_url(@carousel, @image)
  end

  test "should destroy image" do
    assert_difference('Image.count', -1) do
      delete carousel_image_url(@carousel, @image)
    end

    assert_redirected_to carousel_images_url(@carousel)
  end
end
