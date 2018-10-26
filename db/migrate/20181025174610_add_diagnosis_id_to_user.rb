class AddDiagnosisIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :diagnoses_id, :integer, after: :blood_type, null: true
  end
end
