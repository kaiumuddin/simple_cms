class Subject < ApplicationRecord

  # has_one :page
  has_many :pages

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('position ASC') }
  scope :newest_first, -> { order('created_at DESC') }
  scope :search, ->(query) { where(['name LIKE ?', "%#{query}%"]) }

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }

end
