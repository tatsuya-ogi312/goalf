class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'エンジョイ' },
    { id: 3, name: '目指せシングルプレイヤー' },
    { id: 4, name: 'シングルプレイヤー' },
    { id: 5, name: 'セミプロ' },
    { id: 6, name: 'プロ' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :golfer
end
