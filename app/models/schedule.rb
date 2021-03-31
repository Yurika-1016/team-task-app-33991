class Schedule < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :start_time, uniqueness: { scope: :user }
    validates :time_limit_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_limit
end
