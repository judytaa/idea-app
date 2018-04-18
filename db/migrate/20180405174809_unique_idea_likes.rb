class UniqueIdeaLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :idea_likes, [:idea_id, :user_id], unique: true
  end
end
