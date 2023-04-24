class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #Active Storage
  has_one_attached :avatar, dependent: :destroy
  #Associations
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  #Validations  
  validates :email, presence: true, format: {with: /.*@.*.com/, message: "should have an email format"}
  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}
  enum role: {member:0 , admin:1}
  validates :avatar, presence: true
end
