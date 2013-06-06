class MarksController < ApplicationController
  def index
    @user = User.new
    @subjects = Subject.all
    @marks = Mark.all

    # respond_to do |format|
    #   format.html
    #   format.json { render json: @marks }
    # end

    categories = ["INT", "MAT", "PHY"]
    if Crawl.check_uet
      # categories.each do |category|
      #   Crawl.new.crawl_results(category, false)
      # end
      respond_to do |format|
        format.html
        format.json { render json: @marks }
      end
    else
      respond_to do |format|
        format.html { redirect_to sorry_path }
        format.json { render json: { error: "UET die!!" } }
      end
    end
  end

  def filter
    @user = User.new
    @subjects = Subject.all
    case params[:cat]
    when 'int'
      @marks = Mark.filter_int
    when 'mat'
      @marks = Mark.filter_mat
    when 'phy'
      @marks = Mark.filter_phy
    when 'other'
      @marks = Mark.filter_other
    end

    respond_to do |format|
      format.html
      format.json { render json: @marks }
    end
  end

  def uet_suck
    @user = User.new
  end
end