class AddValueToSurveyAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :survey_answers, :value, :integer, null: false, after: :survey_questions_id
  end
end
