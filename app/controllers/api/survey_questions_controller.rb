class Api::SurveyQuestionsController < ApplicationController

  def index
    questions = SurveyQuestion.where(survey_id: params[:survey_id])
    render json: questions
  end
end
