require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    @borrowing = borrowings(:one)
    sign_in @user
    Current.user = @user
  end

  test "should create borrowing" do
    book = books(:three)
    assert_difference("Borrowing.count") do
      post book_borrowings_path(book)
    end

    assert_redirected_to book_path(book)
    assert_equal "Book borrowed successfully.", flash[:notice]
  end

  test "should not create borrowing for already borrowed book" do
    sign_in users(:two)
    assert_no_difference("Borrowing.count") do
      post book_borrowings_path(@book)
    end

    assert_redirected_to book_path(@book)
    assert_equal "Book is already borrowed", flash[:alert]
  end

  test "should destroy borrowing" do
    assert_difference("Borrowing.count", -1) do
      delete borrowing_url(@borrowing)
    end

    assert_redirected_to profile_path
    assert_equal "Book returned successfully.", flash[:notice]
  end

  test "should handle destroy failure" do
    Borrowing.any_instance.stubs(:destroy).returns(false)
    delete borrowing_url(@borrowing)
    assert_redirected_to profile_path
    assert_equal "Failed to return the book.", flash[:alert]
  end

  test "should get profile" do
    get profile_url
    assert_response :success
    assert_not_nil assigns(:borrowings)
  end

  private

  def sign_in(user)
    post session_url, params: { email_address: user.email_address, password: "password" }
  end
end
