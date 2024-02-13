class Question < ApplicationRecord
  belongs_to :user
  belongs_to :asker, class_name: 'User', foreign_key: 'user_id'
  belongs_to :asked_to, class_name: 'User', foreign_key: 'asked_to_id', optional: true
  validates :content, presence: true
  has_many :answers, dependent: :destroy
end
