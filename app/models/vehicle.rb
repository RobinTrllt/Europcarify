class Vehicle < ApplicationRecord
  belongs_to :agency
  has_many :rentals, dependent: :destroy

  validates :genre, presence: true, inclusion: { in: ["voiture", "utilitaire", "prestige"] }
  validates :doors, presence: true, inclusion: { in: [2, 3, 4, 5] }
  validates :capacity, presence: true, inclusion: { in: (2..10) }
  validates :price, presence: true, inclusion: { in: (0..200) }
  validates :fuel, presence: true, inclusion: { in: ["essence", "diesel", "hybride", "électrique"] }
  validates :brand, presence: true
  validates :model, presence: true
end
