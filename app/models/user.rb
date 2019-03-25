class User < ActiveRecord::Base
	acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :topics
  has_many :reviews
  has_many :bookings, dependent: :destroy
  has_many :appointments

  def admin?
  	admin
  end 
 
 end
