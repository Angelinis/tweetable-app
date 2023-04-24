class ChangeRepliesCountDefaultOnTweet < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tweets, :replies_count, from: nil, to: 0
  end
end
