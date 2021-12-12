class Item < ApplicationRecord

  attachment :image
  belongs_to :genre

  enum is_active: { on_sale: true, stop_selling: false }

end
