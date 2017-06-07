class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.string :writer #글작성자
      t.date :date #출발일
      t.time :departuretime #출발시간
      t.string :route #경로
      t.integer :people #모집인원
      t.integer :appliedpeople #신청인원
      t.string :comment #남김 말



      t.timestamps null: false
    end
  end
end
