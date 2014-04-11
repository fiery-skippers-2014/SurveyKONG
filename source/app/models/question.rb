class Question < ActiveRecord::Base
  has_many :question_choices
  belongs_to :survey

  validates :question, presence: true, length: { :maximum => 140 }
  validates :question, uniqueness: {scope: :survey_id}
end
