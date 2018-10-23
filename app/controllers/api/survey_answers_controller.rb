class Api::SurveyAnswersController < ApplicationController
  before_action :authenticate_user!

  def create

    # FIXME エラー処理
    current_user.survey_answers.create!(survey_answer_params)

    render_success
  end


  private

  def survey_answer_params
    params.permit(
      :value,
      :survey_questions_id,
      :survey_id
    )
  end
end
