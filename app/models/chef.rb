class Chef < ApplicationRecord
    has_many :recipes
    before_save { self.email = email.downcase }
    validates :chefname, presence: true, length: {minimum: 2, maximum: 40}
    validates :email, presence: true, length: {maximum: 105}, uniqueness: { case_sensitive: false }, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
end
