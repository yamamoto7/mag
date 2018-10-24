class Api::Users::ImagesController < ApplicationController
  def create
    image = UserImage.create!(user_image_params)
  end
 
  private
    def user_image_params
      params.permit(:user_id, :profile_image)
    end
end
