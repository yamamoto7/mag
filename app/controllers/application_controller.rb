class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token,     if: -> {request.format.json?}

  protected

  def render_success(message = 'success')
      render json: {result: message}
  end

  def render_auth_error(message = 'auth error')
      render json: {result: message}, status: 401
  end

  def render_forbidden(message = 'forbidden')
      render json: {result: message}, status: 403
  end

  def render_conflict(message = 'conflict')
      render json: {result: message}, status: 409
  end

end
