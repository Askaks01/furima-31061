class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_kana, presence: true
    validates :last_kana, presence: true
  end
  validates :birthday, presence:true

  has_many :itmes
  has_many :purchase_histories

end
