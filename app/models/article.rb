class Article < ApplicationRecord
    validates :title, presence: true, length: { minimun: 4, maximum: 100 }
    validates :description, presence: true, length: { minimun: 3, maximum: 300 }
end