class SectionsController < ApplicationController

    layout 'admin'

    before_action :confirm_logged_in
    before_action :find_page
    before_action :set_section_count, :only => [:new, :create, :edit, :update]

  def index
    @sections = @page.sections.sorted # ==> multiple instance
  end

  def show
      @section = Section.find(params[:id]) # ==> single instance
  end

  def new
    # @section = Section.new({:name => 'Default'})
    @section = Section.new(:page_id => @page.id)
  end

  def create
    # Instantiate a new object using form parameters
    @section = Section.new(section_params) #private def below
    @section.page = @page
    # Save the object
    if @section.save
      # If save succeeds, show notice and redirect to the index action
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path(:page_id => @page.id))  # resourceful route back to index page
    else
      # If save fails, redisplay the form so user can fix problems
      render('new') # new.html.erb - this does not perform the new action. This just renders that form template
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    # Find a new object using form parameters
      @section = Section.find(params[:id])
      # Update the object
      if @section.update_attributes(section_params) #private def below
        # If save succeeds, show notice and redirect to the show action
        flash[:notice] = "Section updated successfully."
        redirect_to(section_path(@section, :page_id => @page.id))
      else

        # If save fails, redisplay the form so user can fix problems
        render('edit')
      end
  end

  def delete
      @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    # show notice and redirect to index
    flash[:notice] = "Section '#{@section.name}' destroyed successfully."
    redirect_to(sections_path(:page_id => @page.id))
  end

  private

  # def section_params # This is an example of mass assignment
  #   params.require(:section).permit(:page_id, :name, :position, :visible, :content, :content_type)
  # end

  def section_params
   params.require(:section).permit(:name, :position, :visible, :content_type, :content)
 end
 
  def find_page
      @page = Page.find(params[:page_id])
  end

  def set_section_count
    @section_count = @page.sections.count
    if params[:action] == 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end

end
