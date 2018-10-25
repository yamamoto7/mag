class AddActiveToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :active, :boolean, null: false, default: false, after: :title
  end
end
