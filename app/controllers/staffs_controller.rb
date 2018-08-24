class StaffsController < ApplicationController
  before_action :set_staff, only: [:edit,:update,:destroy,:show]
  before_action :login_check, only: [:new,:edit, :show]
  
  def index
    @staffs = Staff.all
  end

  def new
    if params[:back]
      @staff = Staff.new(staff_params)
    else
      @staff = Staff.new
    end
  end
  
  def destroy
    @staff.destroy
    redirect_to staffs_path
  end
  
  def create
    @staff = Staff.new(staff_params)
    @staff.user_id = current_user.id
    if @staff.save
      #ContactMailer.contact_mail(@staff).deliver
      redirect_to staffs_path
      else
      render 'new'
    end
  end

  def show
     @favorite = current_user.favorites.find_by(staff_id: @staff.id)
  end

  def edit
  end

  def update
    if @staff.update(staff_params)
      redirect_to staffs_path
    else
      render 'edit'
    end
  end

  def confirm
    @staff = Staff.new(staff_params)
    @staff.user_id = current_user.id
    render :new if @staff.invalid?
  end

  def import
    Staff.import(params[:file])
    redirect_to "/staff"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :image, :image_cache,
                                 :password_confirmation)
  end
    def staff_params
      params.require(:staff).permit(:staff_name, :cheo_id, :staff_tel, :staff_add, :skill_biz01, :skill_biz02,
                                    :skill_con01, :skill_con02, :skill_other, :image, :image_cache)
    end

    def set_staff
      @staff = Staff.find(params[:id])
    end

  def login_check
    unless current_user
      redirect_to new_session_path
    end
  end
end