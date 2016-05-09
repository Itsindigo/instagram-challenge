class PhotosController < ApplicationController

  before_filter :authenticate

  def index
    @photos = current_user.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    current_user.photos.create(photo_params)
    redirect_to '/photos'
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to '/photos'
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo successfully deleted"
    redirect_to '/photos'
  end

  def photo_params
    params.require(:photo).permit(:name, :description, :image)
  end
end
