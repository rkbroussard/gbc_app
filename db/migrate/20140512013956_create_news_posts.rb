class CreateNewsPosts < ActiveRecord::Migration
  def change
    create_table :news_posts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :news_posts, [:user_id, :created_at]
  end
end
