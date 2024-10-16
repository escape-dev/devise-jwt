class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: %i[ show update destroy ]

  def index 
    render json: { message: "Success", data: Book.all }, status: :ok
  end

  def create 
    @book = Book.new(book_params)

    if @book.save!
      render json: { message: "Success" }, status: :created
    else
      render json: { message: "Error", data: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show 
    render json: { message: "Success", data: @book }, status: :ok
  end
  
  def update 
    if @book.update(book_params)
      render json: { message: "Success" }, status: :ok
    else
      render json: { message: "Error", data: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy 
    @book.destroy 

    render json: { message: "Success" }, status: :ok
  end

  private 

  def set_book
    @book = Book.find_by_id(params[:id])

    render json: { message: "Not Found" }, status: :not_found if @book.nil?
  end

  def book_params
    params.require(:book).permit(:title, :description).merge(user_id: current_user.id)
  end
end
