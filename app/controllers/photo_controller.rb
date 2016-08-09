class PhotoController < ApplicationController
  before_action :set_info, only: [:show, :index]
  skip_before_filter :verify_authenticity_token
  def index
    original_url = @photo.avatar.url(:original)
    real_url = original_url.gsub(/(\?[0-9]*)/, "")
    render :json =>
    { 
      :photo_url => "domain_name"+real_url, 
      :photo_file_name => @photo.avatar_file_name, 
      :tag_list => @photo.tag_list
    }
  end

  def show
    original_url = @photo.avatar.url(:original)
    real_url = original_url.gsub(/(\?[0-9]*)/, "")
    render :json =>
    { 
      :photo_url => "domain_name"+real_url, 
      :photo_file_name => @photo.avatar_file_name, 
      :tag_list => @photo.tag_list,
      :carb => @photo.carb
    }
  end

  def new
  end

  def create
    image = Paperclip.io_adapters.for(params[:avatar])
    image.original_filename = image.content_type.gsub("image/", "avatar.")
    tag_list = params[:tag_list]
    carb = params[:carb]
    @photo = ClarifaiPhoto.create!(avatar: image ,tag_list: tag_list, avatar_content_type: image.content_type, carb: carb)
    render json: {
      status: 200,
      message: "Successfully created .",
      tag: params[:tag_list],
      photo: @photo.avatar,
      photo_id: @photo.id,
      carb: @photo.carb
    }.to_json if @photo.save
  end

private
  def set_info
    @photo = ClarifaiPhoto.last
  end

  def photo_params
    params.permit(:avatar, :tag_list, :carb)
  end

end
