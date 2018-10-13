class Api::Users::SessionsController < ApplicationController
  # POST ログイン
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_email unless @user

    if @user.valid_password?(params[:password]) then
      sign_in :user, @user
	    render json: @user
    else
      invalid_password
    end
  end

  # DELETE ログアウト
  def destroy
    if sign_out(current_user)
      render :json => {success: true}
    else
      render :json => {success: false}
    end
  end
  
  private
  def invalid_email
    warden.custom_failure!
    render json: { error: 'invalid_email' }
  end

  def invalid_password
    warden.custom_failure!
    render json: { error: 'invalid_password' }
  end
end
