class Api::Users::RegistrationsController < ApplicationController
  def create
    @user = User.new user_params

    if @user.save
      sign_in :user, @user
      render json: @user
    else
      render json: { error: @user.errors }, status: :accepted
    end
  end

  private

  def user_params
    params.permit(
      :email, :password,
      :first_name, :last_name, :first_kana, :last_kana,
      :birth_year, :birth_month, :birth_date,
      :phone_number
      )
  end
end
