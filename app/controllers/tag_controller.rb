class TagController < ApplicationController
  def index
    @tags = ClarifaiPhoto.tagged_with(params[:tags_name]) 
    @avatar_url = []
    @avatar_carb = []
    photo_id = []
    photo_id = @tags.ids
    photo_id.each do
      |photo| @image = ClarifaiPhoto.find(photo)
      @avatar_url << "domain_name"+@image.avatar.url(:medium).gsub(/(\?[0-9]*)/,"")
      @avatar_carb << @image.carb
    end
    render :json =>
    {
      :avatar => @avatar_url,
      :carb => @avatar_carb
    } 
  end

  def show
    @tags = ClarifaiPhoto.tagged_with(params[:tags_name]) 
    render :json => 
    { 
      :tags => @tags
    }
  end

  def create
  end

private
  def set_photo
    @photo = ClarifaiPhoto.find(params[:id])
  end
  
end
