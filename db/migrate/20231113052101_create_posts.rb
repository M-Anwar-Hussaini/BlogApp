class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0
      t.references :author, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
