class Api::SurveyAnswersController < ApplicationController

  def create
    # TODO
    # binding.pry
    # アンケート回答されたときにほぞんするAPI
    #
    survey_id = params[:survey_id]
    
    if current_user.survey_answers.create!(survey_answer_params)

    end

  end


  private

  def survey_answer_params
    # FXIME
  end
end
