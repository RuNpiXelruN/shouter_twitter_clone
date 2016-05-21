class TextShoutsController < ApplicationController

  def create
    content = build_content
    shout = current_user.shouts.build(content: content)
    if shout.save
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Successfully created..."
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def build_content
    TextShout.new(text_shout_params)
  end

  def text_shout_params
    params.require(:text_shout).permit(:body)
  end
end
