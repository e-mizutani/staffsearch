class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :staff_name
      t.text :staff_tel
      t.text :staff_add
      t.text :image
      t.text :skill_biz01
      t.text :skill_biz02
      t.text :skill_con01
      t.text :skill_con02
      t.text :skill_other
      t.text :cheo_id

      t.timestamps
    end
  end
end
