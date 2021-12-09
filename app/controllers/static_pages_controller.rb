class StaticPagesController < ApplicationController
  def hello; end

  def about; end

  def work; end

  def sign_in_preview_admin
    # Set second admin as preview@hannahbauer.me
    sign_in(Admin.second)
    flash[:notice] = 'Welcome to the Admin preview!'
    redirect_to root_path
  end
end
