class Client < ApplicationRecord

  has_many :projects, dependent: :destroy
  has_many :payments

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp, on: :create }, uniqueness: { case_sensitive: false }

end
