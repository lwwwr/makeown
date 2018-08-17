class SignedToOrdersController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :require_permission, only: [:accept, :dismiss, :chosed]

  def chosed
    @order = Order.find(params[:order_id])
    if @order.who != nil
      @order.update_attribute(:chosed, true)
      redirect_to @order
      flash[:primary] = 'Congratulations!'
    else
      redirect_to @order
      flash[:danger] = 'Please, choose the one of them'
    end

  end

  def accept
    @order = Order.find(params[:order_id])
    @order.update_attribute(:who, params[:signed_id])
    redirect_to @order
    flash[:success] = 'Successfully accepted!'
  end

  def dismiss
    @order = Order.find(params[:order_id])
    @order.update_attribute(:who, nil)
    redirect_to @order
    flash[:success] = 'Successfully dismissed!'
  end

  def create
    @order = Order.find(params[:order_id])
    if @order.not_customer?(current_user)
      # @singin = @order.sign!(current_user)
      if @order.signed_to_orders.create(signed_params).save
        redirect_to order_path(@order)
        flash[:success] = 'Subscribed!'
      else
        redirect_to order_path(@order)
        flash[:warning] = 'Something wrong!'
      end
    else
      flash[:danger] = 'You can not to sign in your own order!'
      redirect_to order_path(@order)
    end
  end

  def destroy
    @order = Order.find(params[:order_id])
    if @order.not_customer?(current_user)
      @singin = @order.unsign!(current_user)
      redirect_to order_path(@order)
      flash[:success] = 'UnSubscribed!'
    else
      flash[:danger] = 'You can not to be unsigned in your own order!'
      redirect_to order_path(@order)
    end
  end

  private
  def signed_params
    params.permit(:signed_id, :price)
  end

  def require_permission
    if current_user.id != Order.find(params[:id]).user_id
      redirect_to order_path
      flash[:danger] = 'You are not customer of this order!'
    end
  end
end
