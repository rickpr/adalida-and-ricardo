class ImagesController < ApplicationController
  before_action :set_container
  before_action :set_image, only: %i[show edit update destroy]

  # GET /#{container_type}/1/images
  def index
    @images = @container.images
  end

  # GET /#{container_type}/1/images/1
  def show
  end

  # GET /#{container_type}/1/images/new
  def new
    @image = @container.images.new
  end

  # GET /#{container_type}/1/images/1/edit
  def edit
  end

  # POST /#{container_type}/1/images
  def create
    @image = @container.images.new(image_params)

    if @image.save
      redirect_to [@container, @image], notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /#{container_type}/1/images/1
  def update
    return @image.insert_at(params[:insert_at]) if params[:insert_at]

    if @image.update(image_params)
      redirect_to [@container, @image], notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /#{container_type}/1/images/1
  def destroy
    @image.destroy
    redirect_to carousel_images_url(@container), notice: 'Image was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_container
    # TODO: Implement for other container types (polymorphic association)
    @container = Carousel.find(params[:carousel_id])
  end

  def set_image
    @image = @container.images.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:name, :description, :alt_text, :image)
  end
end
