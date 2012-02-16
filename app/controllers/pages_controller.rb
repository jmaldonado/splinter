class PagesController < ApplicationController
  def home
    @title = "Welcome to the only way to send big files"
  end

  def about
    @title = "About Splinter"
  end

end
