class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, :last_name, :kana_first_name, :kana_last_name, :address, :phone_number, presence: true
         
  def active_for_authentication?
    super && (self.is_vaild == false)
  end
end