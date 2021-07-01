class Project < ApplicationRecord

  belongs_to :client
  
  has_many :comments, dependent: :destroy
  has_many :payments
  
  
  validates :description, presence: true
  validates :name,  presence: true, length: { maximum: 20 }

end
