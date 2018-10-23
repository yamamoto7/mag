class CreateSurveyQuestionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_questions do |t|
      t.references :survey
      t.string :title
      t.integer :question_type
      t.timestamps
    end
  end
end
