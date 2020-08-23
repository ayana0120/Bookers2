class BooksController < ApplicationController
  def index
  	@books = Book.all
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
    @book = Book.find(params[:id])
  end

  def edit
  end

  private
    def book_params
      params.require(:book).permit(:titl, :body)

end