class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :photo
  has_many :questions
  has_many :answers
  has_many :asked_questions, class_name: 'Question', foreign_key: 'asked_to_id'
end
