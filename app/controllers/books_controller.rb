class BooksController < ApplicationController
  def index
  	@books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:complete]="Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :show
    end
  end

  def show
    @books = current_user.posts.all
  end

  def edit
  end

end