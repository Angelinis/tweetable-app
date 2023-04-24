class TweetPolicy < ApplicationPolicy
  def update?
    user == record
  end
end
