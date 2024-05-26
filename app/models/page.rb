class Page < ApplicationRecord
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('position ASC') }
  scope :newest_first, -> { order('created_at DESC') }
  scope :search, ->(query) { where(['name LIKE ?', "%#{query}%"]) }

  validates :name, presence: true, length: { maximum: 255 }
  validates :permalink, presence: true, uniqueness: true, length: { within: 3..255 }
end
