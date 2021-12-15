class Item < ApplicationRecord

  attachment :image
  belongs_to :genre
  has_many :order_details, dependent: :destroy

  enum is_active: { on_sale: true, stop_selling: false }

end
