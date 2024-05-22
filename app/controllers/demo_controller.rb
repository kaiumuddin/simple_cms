class DemoController < ApplicationController

  layout false

  def index
    # render('index')
  end

  def hello
    # render('hello')
    @array = [1,2,3,4,5]
    @id = params['id']
    @page = params[:page]
  end

  def other_hello
    # redirect_to :action => 'index'
    redirect_to(:action => 'index')
    # redirect_to :controller => 'demo', :action => 'index'
  end
end
