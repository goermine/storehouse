class CategoriesController < ApplicationController

  def index
    categories = Category.includes(:products).all
    render json: categories.order(:name), status: 200
  end

  def show
    category = Category.includes(:products).order('products.score DESC')
    render json: category.find(params[:id]), status: 200
  end
end
