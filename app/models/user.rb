class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
  has_one_attached :profile_image

  ROLES = {
    admin: 'admin', manager: 'manager', hr_member: 'hr_member'
  }
  enum role: ROLES


  def account_activate!
    update_attribute :is_active, true
  end

  def account_deactivate!
    update_attribute :is_active, false
  end
  
end
