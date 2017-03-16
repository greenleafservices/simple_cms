class AdminUsersController < ApplicationController

  layout 'admin' # generic header, footer, CSS

    before_action :confirm_logged_in

  def index
      @admin_users = AdminUser.sorted #default sort defined in subject model
  end

  def show
    @admin_user = AdminUser.find(params[:id])
  end

  def new
      @admin_user = AdminUser.new()
  end

  def create
    # Instantiate a new object using form parameters
    @admin_user = AdminUser.new(adminUser_params) #private def below
    # Save the object
    if @admin_user.save
      # If save succeeds, show notice and redirect to the index action
      flash[:notice] = "Admin created successfully."
      redirect_to(admin_users_path)  # resourceful route back to index page
    else
      # If save fails, redisplay the form so user can fix problems
      render('new') # new.html.erb - this does not perform the new action. This just renders that form template

    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    # Find a new object using form parameters
      @admin_user = AdminUser.find(params[:id])
      # Update the object
      if @admin_user.update_attributes(adminUser_params) #private def below
        # If save succeeds, show notice and redirect to the show action
        flash[:notice] = "Admin updated successfully."
        redirect_to(admin_user_path(@admin_user)) # call show.html.erb
      else
        # If save fails, redisplay the form so user can fix problems
        render('edit')
      end
  end

  def delete
      @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    # show notice and redirect to index
    flash[:notice] = "Admin '#{@admin_user.name}' destroyed successfully."
    redirect_to(admin_users_path)
  end

  private

  def adminUser_params
    # Permit :password, but NOT :password_digest
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password, :created_at)
  end

end
