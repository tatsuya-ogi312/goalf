class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :sex
  has_one :golfer
  has_many :articles
  has_many :comments, dependent: :destroy
  has_many :favors, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :height
    validates :weight
    validates :age
    validates :sex_id, numericality: { other_than: 1, message: "を入力してください" }
  end

  def liked_by?(article_id)
    favors.where(article_id: article_id).exists?
  end

end
