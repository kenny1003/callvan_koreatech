class HomeController < ApplicationController
  def index
    #@post = Post.all
    @temp = Post.order(date: :desc)

    @today = Time.now.to_date

    # User.where("id > ?", 200)
    @temp2 = Post.where("date>=?",@today).order(:date) #오늘 날짜 이전 데이터는 출력하지 않는다. ,날짜순으로 출력한다.


    @post = @temp2.all.paginate(:page=>params[:page], :per_page=>7)

    #오늘의 요일 보내기
    @temp_day = Date.today.wday
    @day = ["일",   "월","화","수","목","금","토"]
    @temp_today =@day[@temp_day]





  end

  def look
    @post = Post.find(params[:post_id])

  end

  def post_destroy
    if user_signed_in?
      if current_user.id == Post.find(params[:post_id]).user_id
        @temp_post = Post.find(params[:post_id])

        #해당 포스트에 같이가기를 신청했던 글도 삭제 한다.
        @temp_post.togethers.each do |t|
          t.destroy
        end
        @temp_post.destroy

      end
    end

    redirect_to '/home/index'
  end

  def post_edit
    if user_signed_in?
      if current_user.id == Post.find(params[:post_id]).user_id
        @post = Post.find(params[:post_id])
      end

    else
      redirect_to :back
    end

  end

  def post_update
    @post = Post.find(params[:post_id])
    @post.writer = params[:writer]
    @post.date = params[:date]
    @post.departuretime = params[:departuretime]
    @post.route = params[:route]
    @post.people = params[:people]
    @post.comment = params[:comment]
    #@post.user_id = current_user.id

    @post.save
    redirect_to '/home/index'
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
