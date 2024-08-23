class User < ApplicationRecord
    authenticates_with_sorcery!

    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
    validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
    validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :bookmark_posts, through: :bookmarks, source: :post
    has_many :user_rooms
    has_many :rooms, through: :user_rooms
    has_many :messages

    def own?(object)
        id == object&.user_id
    end

    def bookmark(post)
        bookmark_posts << post
    end

    def unbookmark(post)
        bookmark_posts.destroy(post)
    end

    def bookmark?(post)
        bookmark_posts.include?(post)
    end

    def self.ransackable_attributes(auth_object = nil)
        ["name"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["name"]
    end
end
