class Question < ActiveRecord::Base
  has_many :question_choices
  belongs_to :survey
end
