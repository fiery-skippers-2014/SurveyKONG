class CreateQuestionChoices < ActiveRecord::Migration
  def change
    create_table :question_choices do |question_choice|
      question_choice.belongs_to :question
      question_choice.string :choice
    end
  end
end
