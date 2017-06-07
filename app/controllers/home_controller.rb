class HomeController < ApplicationController
  def index
    #@post = Post.all
    @temp = Post.order(date: :desc)
    @post=@temp
    @post = @temp.all.paginate(:page=>params[:page], :per_page=>7)




  end

  def look
    @post = Post.find(params[:post_id])

  end

  #같이가기 취소하기
  def together_cancle
    @together = Together.find(params[:togetherid])
    @password = params[:pwd]
    if @together.password == @password
      @together.destroy
      @together.post.appliedpeople -= 1
      @together.post.save
    else

    end

    redirect_to :back


  end



end
