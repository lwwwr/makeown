class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_permission, only: [:edit, :update, :destroy]

  def index
    @orders = Order.all.where(chosed: nil)
    #respond_to do |format|
      #format.json { render json: @orders }
      #end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new()
  end

  def edit
      @order = Order.find(params[:id])
  end

  def create
    @user = User.find_by(id: current_user.id)
    @order = @user.orders.create(order_params)
    if @order.save
      redirect_to @order
      flash[:success] = 'Successfully created!'
    else
      render 'new'
      flash[:danger] = 'Something is going wrong!'
    end
  end

  def update
    @user = User.find(current_user)
    @order = user.orders.find(params[:id])
    if @order.update(order_params)
      redirect_to @order
      flash[:success] = 'Order successfully updated'
    else
      render 'edit'
      flash[:danger] = 'Something is going wrong!'
    end


  end

  def destroy
    #@user = User.find(current_user)
    #@order = user.orders.find(params[:id])
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end


  private

  def require_permission
    if current_user.id != Order.find(params[:id]).user_id
      redirect_to order_path
      flash[:danger] = 'You are not customer of this order!'
    else
      flash[:success] = 'Successfully deleted!'
    end
  end

  def order_params
    params.permit(:order).permit(:desc, :address, :who, :status, :end_data)
  end


end
