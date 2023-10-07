class Post < ApplicationRecord
    belongs_to :user, class: "User" 
    has_many :likes
    has_many :comments
end