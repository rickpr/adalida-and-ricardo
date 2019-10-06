class TimelinePostsController < ApplicationController
  before_action :set_timeline
  before_action :set_timeline_post, only: %i[show edit update destroy]

  # GET /timelines/1/timeline_posts
  def index
    @timeline_posts = @timeline.timeline_posts.all
  end

  # GET /timelines/1/timeline_posts/1
  def show
  end

  # GET /timelines/1/timeline_posts/new
  def new
    @timeline_post = @timeline.timeline_posts.new
  end

  # GET /timelines/1/timeline_posts/1/edit
  def edit
  end

  # POST /timelines/1/timeline_posts
  def create
    @timeline_post = @timeline.timeline_posts.new(timeline_post_params)

    if @timeline_post.save
      redirect_to [@timeline, @timeline_post], notice: 'Timeline post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /timelines/1/timeline_posts/1
  def update
    if @timeline_post.update(timeline_post_params)
      redirect_to [@timeline, @timeline_post], notice: 'Timeline post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /timelines/1/timeline_posts/1
  def destroy
    @timeline_post.destroy
    redirect_to timeline_timeline_posts_url(@timeline), notice: 'Timeline post was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_timeline
    @timeline = Timeline.find(params[:timeline_id])
  end

  def set_timeline_post
    @timeline_post = @timeline.timeline_posts.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def timeline_post_params
    params.require(:timeline_post).permit(:title, :description, :body, :date, :image, :image_alt_text, :carousel_id)
  end
end
