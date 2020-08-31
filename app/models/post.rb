class Post < ApplicationRecord
    validates :title, presence: true
    validates :image_url, presence: true
    validates :content, presence: true

    before_save :clear_content

    def clear_content
        self.content = self.content.gsub "SPOILER", ""
        self.content = self.content.gsub "spoiler", ""
    end
end
