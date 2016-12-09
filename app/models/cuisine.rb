class Cuisine < ApplicationRecord
  has_many :restaurants
  has_many :users
  belongs_to :city
  validates :name, presence: true

end
