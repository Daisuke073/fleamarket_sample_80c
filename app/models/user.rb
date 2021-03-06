class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions    
  belongs_to_active_hash :prefecture
  has_many :items 
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_one :cards


  validates :name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birthday, presence: true
  validates :delivery_first_name, presence: true
  validates :delivery_last_name, presence: true
  validates :delivery_first_name_kana, presence: true
  validates :delivery_last_name_kana, presence: true
  validates :zip_code, presence: true
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :street_number, presence: true
  validates :telephone_number, presence: false
  validates :password, presence: true, length: { minimum: 7 }
  validates :encrypted_password, presence: true, length: { minimum: 7 }
end

