class Total < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :start_time, uniqueness: { scope: :user }
    validates :working_hour, numericality: { only_integer: true }
  end
end
