class Answer < ApplicationRecord
  # relations
  belongs_to :user
  belongs_to :question
  # validations
  validates :content, presence: true
end
