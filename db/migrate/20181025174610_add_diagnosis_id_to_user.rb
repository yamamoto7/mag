class AddDiagnosisIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :diagnoses, after: :blood_type
  end
end
