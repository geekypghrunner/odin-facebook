class User < ApplicationRecord
  has_many :sent_requests, class_name:  "FriendRequest",
                                foreign_key: "sender_id"
  has_many :received_requests, class_name:  "FriendRequest",
                                   foreign_key: "recipient_id"
  has_many :posts
  has_many :likes

#  has_many :friends
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :confirmable, omniauth_providers: [:facebook]
         
def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.provider = auth.provider
    user.uid = auth.uid
    user.password = Devise.friendly_token[0,20]
  end
end


end
