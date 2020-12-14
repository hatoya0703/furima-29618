class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '良好' },
    { id: 3, name: 'やや良好' },
    { id: 4, name: '普通' },
    { id: 5, name: 'やや悪い' },
    { id: 6, name: '悪い' }
  ]
  
  include ActiveHash::Associations
  has_many :items

  end