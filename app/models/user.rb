class User < ApplicationRecord
 validates :first_name,  presence: true
 validates :last_name,  presence: true
 validates :title, presence: true, length: { minimum: 5 }
 has_many :projects
end
