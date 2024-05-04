class TaskManager < ApplicationRecord
  belongs_to :user, optional: true
  validates(*%i[title], presence: true)
end
