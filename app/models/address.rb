class Address < ApplicationRecord

  belongs_to :end_user
  def order_address
    "〒" + postal_code + " " + address + " " + name
  end

end