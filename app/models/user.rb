class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rentals, dependent: :destroy

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true },
                  inclusion: { in: 18..100 }
end
