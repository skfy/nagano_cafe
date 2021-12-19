class Item < ApplicationRecord

  attachment :image
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  belongs_to :order
  has_many :cart_items, dependent: :destroy

  enum is_active: { on_sale: true, stop_selling: false }

  def with_tax_price
    (price * 1.1).floor
  end

end
