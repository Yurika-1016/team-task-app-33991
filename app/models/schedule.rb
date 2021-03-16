class Schedule < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :date, uniqueness: { scope: :user }
    validates :time_limit_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_limit
end
