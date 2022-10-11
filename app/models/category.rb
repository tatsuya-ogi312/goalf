class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '基礎トレ' },
    { id: 3, name: 'アドレス' },
    { id: 4, name: 'スイング' },
    { id: 5, name: 'コースマネジメント' },
    { id: 6, name: 'ルール・マナー' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
end
