class VideosController < ApplicationController
  def index
    @videos = Video.all.limit(10)
  end

  def show
    @video = Video.find(params[:id])
    @comments = Comment.find_by(:video_id => params[:video_id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      # redirect to the new show page
      redirect_to root_path
    else
      # render the same form and show user the form errors
      render 'index'
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update(video_params)
    redirect_to root_path
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to root_path
  end


  private
  def video_params
    params.require(:video).permit(:title, :description, :youtube_id)
  end
end
