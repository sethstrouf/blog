class StaticPagesController < ApplicationController
  def hello; end

  def about; end

  def work; end

  def sign_in_preview_admin
    sign_in(Admin.second)
    flash[:notice] = "Welcome to the Admin preview!"
    redirect_to root_path
  end
end
