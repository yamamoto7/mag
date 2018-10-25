class CreateDiagnosesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnoses do |t|
      t.string :title
      t.string :catchcopy
      t.text :description
      t.integer :sex
      t.integer :match_id
    end
  end
end
