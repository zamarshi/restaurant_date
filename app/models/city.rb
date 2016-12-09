class City < ApplicationRecord
  has_many :cuisines
  has_many :users  

end
