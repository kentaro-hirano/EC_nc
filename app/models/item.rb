class Item < ApplicationRecord
  attachment :image
  
  belongs_to :genre, optional: true
  has_many :cart_items
  has_many :favorites, dependent: :destroy
  
  # def favorited_by?(user)
  #   favorites.where(end_user_id: user.id).exists?
  # end
  
  def self.search(search)
    if search
      Item.where(['name LIKE ?', "%#{search}%"])
    else
      Item.all
    end
  end
end
