class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    has_many :items, dependent: :destroy
end
