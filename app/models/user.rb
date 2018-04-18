class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable, :rememberable, :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :ideas
  has_many :idea_likes
end
