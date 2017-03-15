class AdminUsersController < ApplicationController

  layout 'admin' # generic header, footerm CSS

    before_action :confirm_logged_in

  def index
      @adminUsers = AdminUser.sorted #default sort defined in subject model
  end

  def new
      @adminUser = AdminUser.new()
  end

  def create
    # Instantiate a new object using form parameters
    @adminUser = AdminUser.new(adminUser_params) #private def below
    # Save the object
    if @adminUser.save
      # If save succeeds, show notice and redirect to the index action
      flash[:notice] = "Admin created successfully."
      redirect_to(admin_users_path)  # resourceful route back to index page
    else
      # If save fails, redisplay the form so user can fix problems
      render('new') # new.html.erb - this does not perform the new action. This just renders that form template

    end
  end

  def edit
  end

  def delete
      @adminUser = AdminUser.find(params[:id])
  end

  def destroy
    @adminUser = AdminUser.find(params[:id])
    @adminUser.destroy
    # show notice and redirect to index
    flash[:notice] = "Admin '#{@adminUser.name}' destroyed successfully."
    redirect_to(admin_users_path)
  end

  private

  def adminUser_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password_digest, :created_at)
  end

end
