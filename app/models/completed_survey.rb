class CompletedSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :user_answers
end
