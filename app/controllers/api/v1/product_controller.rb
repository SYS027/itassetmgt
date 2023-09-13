class Api::V1::ProductController < ApplicationController
  def index
    products=Product.all
     product_array = []
     products.each do |product|
     hash1 = product.as_json.symbolize_keys
     hash2 = {product_type: product.product_type&.product_type, product_category: product.product_category&.category_name}
     new_hash = hash1.merge!(hash2)
    product_array.push(new_hash)
  end
    render json: product_array
  end

  def create
    product = Product.new(product_params)
    last_company = Company.last
  
    if last_company
      product.company_id = last_company.id
    else
      render json: { errors: ["No companies available to assign to the vendor."] }, status: :unprocessable_entity
      return
    end
  
    if product.save
      render json: product, status: :created
    else
      render json: { errors: product.errors }, status: :unprocessable_entity
    end
  end
  

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def update
    product = Product.find(params[:id])
    last_company = Company.last
  
    if last_company
      product.company_id = last_company.id
    end
  
    if product.update(product_params)
      render json: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end
  

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    head :no_content
  end

  private
  def product_params
    params.require(:product).permit(:product_category_id,:product_name,:manufacturer, :product_type_id, :company_id ,:is_active)
  end 
end

