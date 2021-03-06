class PhotoShoutsController < ApplicationController

  def show
    
  end

  def create
    content = build_content
    shout = current_user.shouts.build(content: content)
    if shout.save
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Error"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def build_content
    PhotoShout.new(photo_shout_params)
  end

  def photo_shout_params
    params.require(:photo_shout).permit(:image)
  end
end
