class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: %i[ show update destroy ]

  def index
    @books = Book.page(params[:page].to_i)

    paginate_response @books, "Success", :ok
  end

  def create
    @book = Book.new(book_params)

    if @book.save!
      default_response nil, "Success", :ok
    else
      default_response @book.errors, "Error", :unprocessable_entity
    end
  end

  def show
    default_response @book, "Success", :ok
  end

  def update
    if @book.update(book_params)
      default_response nil, "Success", :ok
    else
      default_response @book.errors, "Error", :unprocessable_entity
    end
  end

  def destroy
    @book.destroy

    default_response nil, "Success", :ok
  end

  private

  def set_book
    @book = Book.find_by_id(params[:id])

    default_response nil, "Not found", :not_found if @book.nil?
  end

  def book_params
    params.require(:book).permit(:title, :description).merge(user_id: current_user.id)
  end
end
