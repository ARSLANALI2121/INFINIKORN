class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_image

  ROLES = {
    admin: 'admin', manager: 'manager', hr_member: 'hr_member'
  }
  enum role: ROLES
  
end
