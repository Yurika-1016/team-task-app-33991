class TimeRequired < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '<30min' },
    { id: 2, name: '1hour' },
    { id: 3, name: '2hour' },
    { id: 4, name: '3hour' },
    { id: 5, name: '4hour' },
    { id: 6, name: '5hour' },
    { id: 7, name: '6hour' },
    { id: 8, name: '7hour' },
    { id: 9, name: '1day' },
    { id: 10, name: '2days' },
    { id: 11, name: '>3days' }
  ]

  include ActiveHash::Associations
  has_many :tasks
end
