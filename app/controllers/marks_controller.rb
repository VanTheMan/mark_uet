class MarksController < ApplicationController
  def index
    @user = User.new
    categories = ["INT", "MAT", "PHY"]
    categories.each do |category|
      Crawl.new.crawl_results(category)
    end
    @marks = Mark.all
  end

  def filter
    @user = User.new
    case params[:cat]
    when 'int'
      @marks = Mark.filter_int
    when 'mat'
      @marks = Mark.filter_mat
    when 'phy'
      @marks = Mark.filter_phy
    end
  end
end