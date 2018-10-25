class Api::SurveysController < ApplicationController

  def index
    survey = Survey.find(params[:survey_id])
    render json: survey
  end
end
