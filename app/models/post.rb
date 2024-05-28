class Post < ApplicationRecord
    validates :title, presence: true, length: {maximum: 255}
    validates :body, presence: true, length: {maximum: 65_535}
    validates :weight, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :tag_maps, dependent: :destroy
    has_many :tags, through: :tag_maps

    def save_tags(tags)
        tag_list = tags.split(',')
        current_tags = self.tags.pluck(:name)

        old_tags = current_tags - tag_list
        new_tags = tag_list - current_tags

        old_tags.each do |old|
            self.tags.delete Tag.find_by(name: old)
        end

        new_tags.each do |new|
            new_post_tag = Tag.find_or_create_by(name: new.strip)
            self.tags << new_post_tag unless self.tags.include?(new_post_tag)
        end
    end

    def self.ransackable_attributes(auth_object = nil)
        ["title", "body"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["user"]
    end
end
