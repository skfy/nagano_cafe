class Item < ApplicationRecord

  belongs_to :admin
  attachment :profile_image

end
