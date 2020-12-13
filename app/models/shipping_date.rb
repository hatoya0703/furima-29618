class ShippingDate < AvtiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '当日' },
    { id: 3, name: '翌日' },
    { id: 4, name: '3日以内' },
    { id: 5, name: '5以内' },
    { id: 6, name: '1週間以内' },
    { id: 7, name: '要相談' }
  ]

  include ActiveHash::Associations
  has_many :items
end
