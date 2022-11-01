class Golfer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :average_score
  belongs_to :dominant_hand
  belongs_to :type
  belongs_to :golf_history

  with_options presence: true do
    validates :average_putt
    validates :average_score_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :type_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :dominant_hand_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :golf_history_id, numericality: { other_than: 1, message: 'を入力してください' }
  end
end
