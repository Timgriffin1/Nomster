class PhotoController < ApplicationController
   before_action :authenticate_user!
  def new
    @place = Place.find(params[:place_id])
    @photo = Photo.new
  end

  def create 
    @place =Place.find(params[:place_id])
    @place.photos.create(comment_params).merge(user: current_user)
    @place = Place.find(params[:place_id])
    @place.photos.create(photo_params)
    redirect_to place_path (@place)
  end


  private 

  def comment_params
    params.require(:photo).permit(:caption)
  def photo_params
    params.require(:photo).permit(:caption, :picture)
  end
end
