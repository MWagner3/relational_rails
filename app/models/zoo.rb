class Zoo < ApplicationRecord
  has_many :exhibits

  def self.ordered_by_newest
    order(created_at: :desc)
  end

  def exhibit_count
    self.exhibits.count
  end
end
