class CreateSurveyAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_answers do |t|
      t.string :title

      t.timestamps
    end
  end
end
