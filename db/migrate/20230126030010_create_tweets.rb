class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.integer :replies_count
      t.integer :likes_count
      t.references :user, null: false, foreign_key: true
      t.references :replied_to, null: true, foreign_key: {to_table: :tweets}

      t.timestamps
    end
  end
end
