class Question < ActiveRecord::Base
  has_many :question_choices
  has_many :user_answers
  belongs_to :survey

  validates :question, presence: true, length: { :maximum => 140 }
  validates :question, uniqueness: {scope: :survey_id}
end
