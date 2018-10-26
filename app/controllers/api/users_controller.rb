class Api::UsersController < ApplicationController
  def get_info
    render json: current_user
  end
  def index
    @users = User.all.where.not(sex: current_user.sex)
  end
  def rand_index
    @users = User.all.where.not(sex: current_user.sex).shuffle.first(10)
  end
  def show
    @user = User.find(params[:id])
    # イイネ済みかどうかを判断して、booleanで持つ
    @have_already_liked = current_user.likes_users.exists?(id: params[:id])
  end
  def update
    current_user.update(user_params)
    render json: current_user
  end

  private

  def user_params
    params.permit(
      :birth_year, :birth_month, :birth_date,
      :phone_number, :profile,
      :sex, :tall, :weight_type, :academic, :blood_type,
      :state, :birth_state, :brother, :martial_status, :children,
      :salary, :job, :job_detail, :academic_status,
      :holiday, :check_point, :when_meet, :cigarette, :alcohol
      )
  end

end
