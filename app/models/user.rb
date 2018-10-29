class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 #validates :first_name,  presence: true
 #validates :last_name,  presence: true
 #validates :title, presence: true, length: { minimum: 5 }
 has_many :projects, dependent: :destroy
 #belongs_to :category
 validates :image_url, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
end
