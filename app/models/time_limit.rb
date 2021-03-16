class TimeLimit < ActiveHash::Base
  self.data = [
    { id: 0, name: '制限なし' },
    { id: 1, name: '~12:00' },
    { id: 2, name: '13:00' },
    { id: 3, name: '14:00' },
    { id: 4, name: '15:00' },
    { id: 5, name: '16:00' },
    { id: 6, name: '17:00' },
    { id: 7, name: '18:00' },
    { id: 8, name: '19:00' },
    { id: 9, name: '20:00' },
    { id: 10, name: '21:00' },
    { id: 11, name: '22:00' }
  ]

  include ActiveHash::Associations
  has_many :schedules
end
