class Appointment < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  belongs_to :user
  has_many :bookings
end
