class Api::SurveyQuestionsController < ApplicationController

  def index
    questions = SurveyQuestion.where(survey_id: params[:survey_id])
    render json: questions
  end

  def show
    question = SurveyQuestion.find_by!(id: params[:id])
    render json: question
  end
end
