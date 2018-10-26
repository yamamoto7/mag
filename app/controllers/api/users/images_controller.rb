class Api::Users::ImagesController < ApplicationController
  def index
    # ( ,,`･ω･´)強引だけど許してね
    user = User.find(params[:user_id])
    @images = user.user_images
    # ActiveStorage::Current.host = request.base_url
    # render json: images, include: [{profile_image: {include: {blob: {methods: :service_url}}}}]
  end
  def create
    image = current_user.user_images.create!(user_image_params)
  end
 
  private
    def user_image_params
      params.permit(:user_id, :profile_image)
    end
end
