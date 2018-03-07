class Friendship < ApplicationRecord
    belongs_to :accept_friend, class_name: "User"
    belongs_to :sent_friend, class_name: "User"
    
end
