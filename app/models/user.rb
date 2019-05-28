class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :events, through: :participations

  validates :username, presence: true, allow_blank: false, uniqueness: true, length: { in: 1..15 }
  validates :password, presence: true, length: { in: 6..20 }
  validates :mobile, presence: true, format: { with: /\A((((\+33)|(\(\+33\)))(\s|-)*[1-9])|(0[1-9]))((\s|-)*\d{2}){4}\z/ }
  validates :email, presence: true, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+\.)+([a-zA-Z]{2,5})\z/ }
end
