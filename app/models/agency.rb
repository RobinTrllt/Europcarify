class Agency < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
