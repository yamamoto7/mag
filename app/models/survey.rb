class Survey < ApplicationRecord
  has_many :survey_answers
  has_many :users, through: :survey_answers

end
