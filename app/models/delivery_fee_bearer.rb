class DeliveryFeeBearer < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '0' },
    { id: 3, name: '100' },
    { id: 4, name: '200' },
    { id: 5, name: '300' },
    { id: 6, name: '400' },
    { id: 7, name: '500' }
  ]

  include ActiveHash::Associations
  has_many :items

  end