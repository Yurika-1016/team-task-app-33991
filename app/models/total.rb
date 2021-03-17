class Total < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :date, uniqueness: { scope: :user }
    validates :working_hour, numericality: { only_integer: true }
  end
end
