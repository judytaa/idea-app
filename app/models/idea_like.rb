class IdeaLike < ApplicationRecord
  belongs_to :idea
  belongs_to :user

  validates :idea_id, uniqueness: {scope: :user_id, message: "has been a ready liked!"}
end
