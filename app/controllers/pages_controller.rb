class PagesController < ApplicationController

    layout 'admin'

    before_action :confirm_logged_in
    before_action :find_subject
    before_action :set_page_count, :only => [:new, :create, :edit, :update]

    def index
      @pages = @subject.pages.sorted
    end

  def show
      @page = Page.find(params[:id]) # ==> single instance
  end

  def new
    @page = Page.new(:subject_id => @subject.id)
  end

  def create
    # Instantiate a new object using mass assignment and form parameters
    @page = Page.new(page_params) #private def below
    @page.subject = @subject
    # Save the object
    if @page.save
      # If save succeeds, show notice and redirect to the index action
      flash[:notice] = "Page created successfully."
      redirect_to(pages_path(:subject_id => @subject.id))
    else
      # If save fails, redisplay the form so user can fix problems
      render('new') # new.html.erb - this does not perform the new action. This just renders that form template
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    # Find a new object using form parameters
      @page = Page.find(params[:id])
      # Update the object
      if @page.update_attributes(page_params) #private def below
        # If save succeeds, show notice and redirect to the show action
        flash[:notice] = "Page updated successfully."
        redirect_to(page_path(@page, :subject_id => @subject.id))
      else
        # If save fails, redisplay the form so user can fix problems
        render('edit')
      end
  end

  def delete
      @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    # show notice and redirect to index
    flash[:notice] = "Page '#{@page.name}' destroyed successfully."
    redirect_to(page_path(:subject_id => @subject.id))
  end

  private

  def page_params # This is an example of mass assignment
    params.require(:page).permit(:name, :position, :visible, :subject_id, :permalink)
  end

  def find_subject
      @subject = Subject.find(params[:subject_id])
  end

  def set_page_count
    @page_count = @subject.pages.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count += 1
    end
  end
end
