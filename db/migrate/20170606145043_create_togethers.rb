class CreateTogethers < ActiveRecord::Migration
  def change
    create_table :togethers do |t|

      t.string :name #같이타기 신청한 사람 이름
      t.string :phone #핸드폰번호
      t.string :kakao #카카오아이
      t.string :password #작성글 비밀번호

      t.integer :post_id #해당


      t.timestamps null: false
    end
  end
end
