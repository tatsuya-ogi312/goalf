class AverageScore < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '70台' },
    { id: 3, name: '80台' },
    { id: 4, name: '90台' },
    { id: 5, name: '100台' },
    { id: 6, name: '110台~' },
    { id: 7, name: '秘密' }
  ]

  include ActiveHash::Associations
  has_many :golfers
end
