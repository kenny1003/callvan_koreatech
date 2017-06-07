class FindController < ApplicationController
  def index


  end

  #같이타기 신청
  def together
    @together = Together.new
    @together.name = params[:name]
    @together.phone = params[:phone]
    @together.kakao = params[:kakao]
    @together.password= params[:pwd]

    @together.post_id= params[:postid]
    @together.save

    @post=Post.find(params[:postid])
    @post.appliedpeople +=1
    @post.save


    redirect_to :back
  end

  #콜밴친구 모집
  def write
    @post = Post.new
    @post.writer = params[:writer]
    @post.date = params[:date]
    @post.departuretime = params[:departuretime]
    @post.route = params[:route]
    @post.people = params[:people]
    @post.comment = params[:comment]

    @post.appliedpeople = 0
    @post.user_id = current_user.id

    @post.save
    redirect_to :back

  end
end
