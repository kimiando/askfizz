class Question < ApplicationRecord
  # relations
  belongs_to :user
  belongs_to :asker, class_name: 'User', foreign_key: 'user_id'
  belongs_to :asked_to, class_name: 'User', foreign_key: 'asked_to_id', optional: true
  has_many :answers, dependent: :destroy
  # validations
  validates :content, presence: true
end
