class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(staff_id: params[:staff_id])
    redirect_to staffs_url, notice: "#{favorite.staff.user.name}をよく使う連絡先に登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to staffs_url, notice: "#{favorite.staff.user.name}をよく使う連絡先から解除しました"
  end
end
