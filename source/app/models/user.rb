
# this is waaaay to many models, I think.
# you definitely need users, surveys, questions, and choices.
# users have surveys, surveys have questions, questions have choices.
# users also have answers, which is a join table between choices and users.
# that's pretty much it. All associations can handled through the query interface
# you should be able to call:
#
# user.surveys
# survey.questions
# question.choices
# choice.answers
# user.answered_surveys (linked through the answers table)
# survey.answers (brings all the answers back)
# survey.respondents (linked through the answers table)
#
# you would return the result of survey.answers in JSON, and let the client handle
# the display of the data. You could do that transform on the server as well.


class User < ActiveRecord::Base
  has_many :surveys
  has_many :completed_surveys

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_presence_of :name


  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user.password != password
      @user.errors[:base] << "Wrong password"
    end
    return @user
  end
end
