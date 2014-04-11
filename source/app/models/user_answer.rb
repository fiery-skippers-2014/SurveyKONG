class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question_choice
  belongs_to :completed_survey
end
