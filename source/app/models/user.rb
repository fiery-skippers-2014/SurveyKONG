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
