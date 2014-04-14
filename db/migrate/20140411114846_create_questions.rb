class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |question|
      question.belongs_to :survey
      question.string :question
    end
  end
end
