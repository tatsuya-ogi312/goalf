class GolfHistory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1年未満' },
    { id: 3, name: '1〜2年' },
    { id: 4, name: '3〜5年' },
    { id: 5, name: '5〜10年' },
    { id: 6, name: '10年以上' }
  ]

  include ActiveHash::Associations
  has_many :golfer
end
