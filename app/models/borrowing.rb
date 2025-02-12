class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true
  validate :book_availability

  def book_availability
    errors.add(:book, "is already borrowed") if book.borrowings.exists?
  end
end
