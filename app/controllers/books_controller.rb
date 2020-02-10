class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @books = Book.all
    @book = Book.new
    @profile_image = current_user.profile_image
  end

  def create
   @book = Book.new(book_params)
   #↓↓user_idを今ログインしているユーザーのidに設定する
   @book.user_id = current_user.id
     if @book.save
        flash[:notice] = "You have creatad book successfully."
        redirect_to book_path(@book)
     else
        @books = Book.all
        render :index
     end
  end

  def edit
     @book = Book.find(params[:id])
  end

  def show
    @books = Book.all
    @newbook = Book.new
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
       render :edit
    end
  end

  def destroy
     @book = Book.find(params[:id])
       if @book.destroy
          redirect_to books_path
       else
        @books = Book.all
        render :index
       end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
     if @book.user.id != current_user.id
        redirect_to books_path
     end
  end

end
