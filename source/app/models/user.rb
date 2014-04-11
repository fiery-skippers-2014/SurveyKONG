class User < ActiveRecord::Base
  has_many :surveys
  has_many :completed_surveys
end
