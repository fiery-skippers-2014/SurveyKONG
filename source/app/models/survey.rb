class Survey < ActiveRecord::Base
  has_many :questions
  has_many :completed_surveys

  validates :title, presence: true, length: { :maximum => 140 }
  validates :description, length: { :maximum => 400 }
end
