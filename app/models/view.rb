class View < ApplicationRecord
  belongs_to :viewer, class_name: "User"
  belongs_to :viewed_user, class_name: "User"
end
