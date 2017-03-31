class User < ApplicationRecord
  # Direct associations

  has_many   :rec_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  # Indirect associations

  has_many   :newsfeed,
             :through => :following,
             :source => :photos

  has_many   :followers,
             :through => :rec_requests,
             :source => :sender

  has_many   :following,
             :through => :sent_requests,
             :source => :recipient

  has_many   :favorites,
             :through => :likes,
             :source => :photo

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
