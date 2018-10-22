class AddQuestionIdToSurveyAnswer < ActiveRecord::Migration[5.2]
  def change
    add_reference :survey_answers, :survey_questions, index: true, after: :survey_id
  end
end
