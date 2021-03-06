class ReviewForm < Rectify::Form
  STRING_ATTRS = [:title, :desc].freeze
  INTEGER_ATTRS = [:grade, :book_id, :user_id].freeze

  STRING_ATTRS.each { |name| attribute name, String }

  INTEGER_ATTRS.each do |name|
    attribute name, Integer
    validates name, presence: true
  end

  validates :title, :desc, presence: true, spec_symbols: true
  validates :title, length: { maximum: 80 }
  validates :desc, length: { maximum: 500 }
  validates :grade, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 5 }
end
