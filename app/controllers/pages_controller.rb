class PagesController < ApplicationController
  def home
    if signed_in?

    else
      @user = User.new
    end
  end
end
