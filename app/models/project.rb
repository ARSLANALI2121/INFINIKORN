class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :name, :description, presence: true
end
