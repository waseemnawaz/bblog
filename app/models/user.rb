class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 #validates :first_name,  presence: true
 #validates :last_name,  presence: true
 #validates :title, presence: true, length: { minimum: 5 }
 has_many :projects, dependent: :destroy
end
