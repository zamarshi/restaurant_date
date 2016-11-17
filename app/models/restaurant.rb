class Restaurant < ApplicationRecord
  has_many :users
  belongs_to :cuisine
  validates :title, presence: true
  validates :cuisine, presence: true

end
