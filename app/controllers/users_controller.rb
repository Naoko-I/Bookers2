class UsersController < ApplicationController

before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]

def index
  @book = Book.new
  @books = Book.all
  @users = User.all
end

def show
  @book = Book.new
  @user = User.find(params[:id])
  @books = @user.books
end

def edit
  @user = User.find(params[:id])
end
# ↓イメージ画像投稿のためにcreateアクション足した
def create
  @profile_image = profile_image.new(profile_image_params)
  @profile_image.user_id = current_user.id
    if @profile_image.save
       redirect_to user_path(@user.id)
    end
  @book = Book.new(book_path)
    if @book.save
       redirect_to book_path(@book.id)
    else
       render :index
    end
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    render :edit
  end
end

private
 def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
 end

 def book_params
    params.require(:book).permit(:title, :body)
 end

 def correct_user
  @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user)
    end
 end

end

