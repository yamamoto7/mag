class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[auth sign_up]

  # def index; end
  def top; end
  def save_image; end
  def sign_up; end
  def auth; end
  def survey; end

  private
  def redirect_root
    redirect_to :top and return if current_user
  end
end
