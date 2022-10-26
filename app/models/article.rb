class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favors, dependent: :destroy
  is_impressionable counter_cache: true #impressionの使用許可と閲覧回数の更新設定

  with_options presence: true do
    validates :title
    validates :content
    validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  end

end
