class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '本・雑誌' },
    { id: 3, name: 'DVD・ゲーム' },
    { id: 4, name: '家電' },
    { id: 5, name: '服' },
    { id: 6, name: '美容' },
    { id: 7, name: '食品・飲料' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: '日用品' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

  end