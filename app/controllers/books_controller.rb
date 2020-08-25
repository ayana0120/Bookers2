class BooksController < ApplicationController

  def new
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:complete]="Book was successfully created."
      redirect_to book_path(@book)
    else
      @user = current_user
      @book = @book.user_id
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  @book = Book.find(params[:id])
  @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:complete]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:complete]="Book was successfully destroyed."
      redirect_to books_path
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end