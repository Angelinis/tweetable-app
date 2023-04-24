class Tweet < ApplicationRecord
  belongs_to :user
  #Self join
  has_many :replies, class_name: "Tweet", foreign_key: "replied_to_id",
                                         inverse_of: "replied_to",
                                         dependent: :destroy

  belongs_to :replied_to, class_name: "Tweet", optional: true, counter_cache: :replies_count

  has_many :likes, dependent: :destroy
  #Validations
  validates :body, presence: true, length: {maximum: 140}
end
