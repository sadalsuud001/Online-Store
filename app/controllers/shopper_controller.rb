class ShopperController < ApplicationController
    skip_before_action :authorize
    include CurrentCart
    before_action :set_cart
    
  def index
    if params[:field] == nil
      @products = Product.order(:name)
    elsif params[:field].is_number?
      @products = Product.where("cast(price as real) == ?", params[:field].to_f).order("name")
    elsif params[:field].is_a?(String)
      @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:field]}%", "%#{params[:field]}%").order("name")
    end 
      
    if @products == nil
      @products = []  
    end
  end
end

class Object
  def is_number?
    self.to_f.to_s == self.to_s || self.to_i.to_s == self.to_s
  end
end