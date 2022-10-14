class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :sex
  has_one :golfer
  has_many :articles
  with_options presence: true do
    validates :nickname
    validates :height
    validates :weight
    validates :age
    validates :sex_id, numericality: { other_than: 1, message: "を入力してください" }
  end
end
