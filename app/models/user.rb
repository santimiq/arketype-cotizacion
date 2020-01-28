class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :quotations, dependent: :destroy
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
