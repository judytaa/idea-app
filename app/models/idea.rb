class Idea < ApplicationRecord
  has_many :comments
  has_many :idea_likes, :dependent => :destroy
end
