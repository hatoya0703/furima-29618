class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '翌日' },
    { id: 3, name: '2~3日後' },
    { id: 4, name: '1週間以内' },
    { id: 5, name: '一週間以上' },
    { id: 6, name: '要相談' }
  ]

  include ActiveHash::Associations
  has_many :items
end
