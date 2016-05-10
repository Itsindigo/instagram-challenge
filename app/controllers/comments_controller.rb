class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(comment_params)
    redirect_to(:back)
  end

  def destroy
    @comment = Comment.find(params[:id])
  end

  def comment_params
   params.require(:comment).permit(:comment_entry)
  end
end
