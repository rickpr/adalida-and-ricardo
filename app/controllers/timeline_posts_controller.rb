class TimelinePostsController < ApplicationController
  before_action :set_timeline
  before_action :set_timeline_post, only: %i[show edit update destroy]

  # GET /timelines/1/timeline_posts
  # GET /timelines/1/timeline_posts.json
  def index
    @timeline_posts = @timeline.timeline_posts.all
  end

  # GET /timelines/1/timeline_posts/1
  # GET /timelines/1/timeline_posts/1.json
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
  # POST /timelines/1/timeline_posts.json
  def create
    @timeline_post = @timeline.timeline_posts.new(timeline_post_params)

    respond_to do |format|
      if @timeline_post.save
        format.html { redirect_to [@timeline, @timeline_post], notice: 'Timeline post was successfully created.' }
        format.json { render :show, status: :created, location: [@timeline, @timeline_post] }
      else
        format.html { render :new }
        format.json { render json: @timeline_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelines/1/timeline_posts/1
  # PATCH/PUT /timelines/1/timeline_posts/1.json
  def update
    respond_to do |format|
      if @timeline_post.update(timeline_post_params)
        format.html { redirect_to [@timeline, @timeline_post], notice: 'Timeline post was successfully updated.' }
        format.json { render :show, status: :ok, location: [@timeline, @timeline_post] }
      else
        format.html { render :edit }
        format.json { render json: @timeline_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelines/1/timeline_posts/1
  # DELETE /timelines/1/timeline_posts/1.json
  def destroy
    @timeline_post.destroy
    respond_to do |format|
      format.html { redirect_to timeline_timeline_posts_url(@timeline), notice: 'Timeline post was successfully destroyed.' }
      format.json { head :no_content }
    end
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
    params.require(:timeline_post).permit(:title, :description, :body, :date, :image, :image_alt_text)
  end
end
