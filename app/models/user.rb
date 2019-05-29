class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :events, through: :participations
  has_many :messages, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  validates :mobile, presence: true, format: { with: /\A((((\+33)|(\(\+33\)))(\s|-)*[1-9])|(0[1-9]))((\s|-)*\d{2}){4}\z/ }
  validates :email, presence: true, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+\.)+([a-zA-Z]{2,5})\z/ }
end
