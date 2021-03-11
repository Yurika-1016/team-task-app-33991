class Task < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name, :implementation_date, :dead_line_date
    with_options numericality: { other_than: 0 } do
      validates :time_required_id, :operator_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_required
end
