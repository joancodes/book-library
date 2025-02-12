class BooksController < ApplicationController
  allow_unauthenticated_access only: %i[index show]
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
end
