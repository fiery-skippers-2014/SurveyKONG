class CreateCompletedSurveys < ActiveRecord::Migration
  def change
    create_table :completed_surveys do |completed_survey|
      completed_survey.belongs_to :user
      completed_survey.belongs_to :survey
      completed_survey.timestamps
    end
  end
end
