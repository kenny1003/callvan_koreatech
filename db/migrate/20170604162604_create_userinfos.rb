class CreateUserinfos < ActiveRecord::Migration
  def change
    create_table :userinfos do |t|
      t.integer :user_id #유저랑 1:1 매치
      t.string :nickname
      t.string :sex
      t.string :phone #번호만
      t.boolean :check, :default => false #유저가 인포를 작성했는지 확인, 디폴트는 false

      t.timestamps null: false
    end
  end
end
