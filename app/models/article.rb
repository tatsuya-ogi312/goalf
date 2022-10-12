class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :content
    validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  end
end
