class CreateSurveyAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_answers do |t|
      t.references :user
      t.references :survey

      t.timestamps
    end
  end
end
