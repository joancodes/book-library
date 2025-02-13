require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  setup do
    @book = books(:one)
    @user = users(:one)
    @due_date = 2.weeks.from_now
    @borrowing = borrowings(:one)
  end

  test "should not save borrowing without due_date" do
    borrowing = Borrowing.new(user: @user, book: @book)
    assert_not borrowing.save, "Saved the borrowing without a due_date"
  end

  test "should not allow borrowing an already borrowed book" do
    user2 = users(:two)
    @borrowing = Borrowing.new(user: user2, book: @book, due_date: @due_date)
    assert_not @borrowing.save, "Allowed borrowing an already borrowed book"
  end
end
