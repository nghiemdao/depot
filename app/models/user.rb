class User < ApplicationRecord
  scope :ordered, -> { order(:name) }

  validates :name, presence: true, uniqueness: true

  has_secure_password
end
