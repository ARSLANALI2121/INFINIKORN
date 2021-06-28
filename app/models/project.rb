class Project < ApplicationRecord
  belongs_to :client
  has_many  :comments, dependent: :destroy
  
  validates :description, presence: true
  validates :name,  presence: true, length: { maximum: 20 }
end
