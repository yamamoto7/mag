class Api::SurveysController < ApplicationController

  def show
    survey = Survey.find(params[:id])
    render json: survey
  end
end
