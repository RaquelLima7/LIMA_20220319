class VideosController < ApplicationController
  # GET /videos or /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # POST /videos or /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        save_images if @video.thumbnail.attached?
        format.html { redirect_to root_path, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :category, :video, :thumbnail)
  end

  def save_images
    @video.update(image_64: url_for(@video.thumbnail.variant(resize: '64x64')))
    @video.update(image_128: url_for(@video.thumbnail.variant(resize: '128x128')))
    @video.update(image_256: url_for(@video.thumbnail.variant(resize: '256x256')))
  end
end
