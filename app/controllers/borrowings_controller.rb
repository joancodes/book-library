class BorrowingsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @borrowing = Current.user.borrowings.new(book: @book, due_date: 2.weeks.from_now)

    if @borrowing.save
      flash[:notice] = "Book borrowed successfully."
    else
      flash[:alert] = @borrowing.errors.full_messages.to_sentence
    end
    redirect_to @book
  end

  def destroy
    @borrowing = Borrowing.find(params[:id])
    if @borrowing.destroy
      flash[:notice] = "Book returned successfully."
    else
      flash[:alert] = "Failed to return the book."
    end
    redirect_to profile_path
  end

  def profile
    @borrowings = Current.user.borrowings.includes(:book)
  end
end
