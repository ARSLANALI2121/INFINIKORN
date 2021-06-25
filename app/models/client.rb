class Client < ApplicationRecord

  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_FORMAT }

end
