require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "Test Author", isbn: "1234567890123")
    assert_not book.save, "Saved the book without a title"
  end

  test "should not save book without author" do
    book = Book.new(title: "Test Title", isbn: "1234567890123")
    assert_not book.save, "Saved the book without an author"
  end

  test "should not save book without isbn" do
    book = Book.new(title: "Test Title", author: "Test Author")
    assert_not book.save, "Saved the book without an ISBN"
  end

  test "should not save book with duplicate isbn" do
    Book.create(title: "Book One", author: "Author One", isbn: "1234567890123")
    book = Book.new(title: "Book Two", author: "Author Two", isbn: "1234567890123")
    assert_not book.save, "Saved the book with a duplicate ISBN"
  end
end
