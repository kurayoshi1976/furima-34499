class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }
  validates :first_name, presence: true, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }
  validates :last_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
