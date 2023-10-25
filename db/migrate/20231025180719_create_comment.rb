class CreateComment < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :users, foreign_key: true
      t.references :posts, foreign_key: true

      t.timestamps
    end
  end
end
