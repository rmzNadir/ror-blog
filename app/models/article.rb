# Article model
class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 20 }
  before_save :set_visits_count

  def update_visits_count
    update(visits_count: visits_count + 1)
  end

  private

  def set_visits_count
    self.visits_count ||= 0
  end
end
