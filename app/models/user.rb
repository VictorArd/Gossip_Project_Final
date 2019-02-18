class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes

  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :last_name,
    presence: true

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
    presence: true

  has_secure_password
  validates :password,
    presence: true

  validates :password_confirmation,
    presence: true

end
