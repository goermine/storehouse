class CategoriesController < ApplicationController

  def index
    categories = Category.includes(:products).all
    render json: categories.order(:name), status: 200
  end

  def show
    category = Category.includes(:products).find(params[:id])
    render json: category, status: 200
  end
end
