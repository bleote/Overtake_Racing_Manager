class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :races, dependent: :destroy
  has_one_attached :photo
  has_many :teams, through: :races

  validates_uniqueness_of :email
  validates_presence_of :email, :first_name, :last_name
end
