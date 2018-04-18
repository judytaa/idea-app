class CreateIdeaLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :idea_likes do |t|
      t.references :idea, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
