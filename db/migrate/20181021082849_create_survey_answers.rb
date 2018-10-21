class CreateSurveyAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_answers do |t|
      t.integer :user_id
      t.integer :survey_id

      t.timestamps
    end
  end
end
