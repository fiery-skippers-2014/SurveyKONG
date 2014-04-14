class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |user_answer|
      user_answer.belongs_to :user
      user_answer.belongs_to :question_choice
      user_answer.belongs_to :completed_survey
      user_answer.belongs_to :question
    end
  end
end
