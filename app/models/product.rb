class Product < ApplicationRecord
  scope :ordered_by_title, -> { order(:title) }

  has_many :line_items
  has_many :orders, through: :line_items
  
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  before_destroy :ensure_not_referred_by_any_line_item

  def latest_order
    orders.latest
  end

  private

  def ensure_not_referred_by_any_line_item
    if line_items.any?
      errors.add(:base, 'Line Items present.')
      throw :abort
    end
  end
end
