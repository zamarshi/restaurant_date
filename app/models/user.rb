class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX


  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy

  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

  has_many :active_views, class_name: "View", foreign_key: "viewer_id"
  has_many :passive_views, class_name: "View", foreign_key: "viewed_user_id"
  has_many :viewers, through: :passive_views, source: :viewer
  has_many :viewed_users, through: :active_views, source: :viewed_user

  belongs_to :city
  belongs_to :cuisine
  belongs_to :restaurant

  def full_name
    "#{first_name} #{last_name}".strip.squeeze(' ').titleize
  end
  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def match? (other_user)
    following.include?(other_user) && other_user.following.include?(self)
  end
  #
  def matches
    User.where(id:(Relationship.where(follower_id: self.active_relationships.map(&:followed_id)).where(followed_id: self.id).map(&:follower_id)))
  end
  #

  def view(other_user)
    active_views.create(viewed_user_id: other_user.id)
  end

  def viewed?(other_user)
    viewed_users.include?(other_user)
  end

  private

  def downcase_email
    self.email.downcase! if email.present?
  end

end
