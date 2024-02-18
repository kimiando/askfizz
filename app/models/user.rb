class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validations
  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # relations
  has_one_attached :photo
  has_many :questions
  has_many :answers
  has_many :asked_questions, class_name: 'Question', foreign_key: 'asked_to_id'
  # follow relations
  has_many :followed_relationships, foreign_key: 'follower_id', class_name: 'Follow', dependent: :destroy
  has_many :followed_users, through: :followed_relationships, source: :followed

  has_many :follower_relationships, foreign_key: 'followed_id', class_name: 'Follow', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
end
