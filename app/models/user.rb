class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maxium: 20}
  validates :introduction, presence: true, length: { maxium: 50}

  has_many :books, dependent: :destroy
  attachment :progile_image
end
