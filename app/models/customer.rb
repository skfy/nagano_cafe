class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { self.email.downcase! }

  has_many :addresses, dependent: :destroy

  enum is_active: { effectiveness: true, withdrawal: false }

end
