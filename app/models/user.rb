class User < ActiveRecord::Base

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, numericality: {greater_than: 7}

  paginates_per 50

  has_secure_password
  has_many :reviews 

  def full_name
    "#{firstname} #{lastname}"
  end

  protected

end
