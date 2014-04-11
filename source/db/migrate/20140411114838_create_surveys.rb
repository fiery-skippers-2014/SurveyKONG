class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |survey|
      survey.belongs_to :user
      survey.string :title
      survey.string :description
      survey.timestamps
    end
  end
end
