class AddUserToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_reference :staffs, :user, index: true
  end
end
