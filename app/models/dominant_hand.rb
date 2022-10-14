class DominantHand < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '右手' },
    { id: 3, name: '左手' }
  ]

  include ActiveHash::Associations
  has_many :golfers
end
