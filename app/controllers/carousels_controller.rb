class CarouselsController < ApplicationController
  before_action :set_carousel, only: %i[show edit update destroy]

  # GET /carousels
  def index
    @carousels = Carousel.all
  end

  # GET /carousels/1
  def show
  end

  # GET /carousels/new
  def new
    @carousel = Carousel.new
  end

  # GET /carousels/1/edit
  def edit
  end

  # POST /carousels
  def create
    @carousel = Carousel.new(carousel_params)

    if @carousel.save
      redirect_to @carousel, notice: 'Carousel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /carousels/1
  def update
    if @carousel.update(carousel_params)
      redirect_to @carousel, notice: 'Carousel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /carousels/1
  def destroy
    @carousel.destroy
    redirect_to carousels_url, notice: 'Carousel was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_carousel
    @carousel = Carousel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def carousel_params
    params.require(:carousel).permit(:name, :description)
  end
end
