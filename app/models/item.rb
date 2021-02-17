class Item < ApplicationRecord
  attachment :image
  
  belongs_to :genre, optional: true
  has_many :cart_items
  
  def self.search(search)
    if search
      Item.where(['name LIKE ?', "%#{search}%"])
    else
      Item.all
    end
  end
end
