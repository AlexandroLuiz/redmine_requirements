class RequirementsController < ApplicationController
   unloadable

    menu_item :requirements

  #filter the current project
 before_filter :current_project


  def index

  end



   private
   def current_project
      @project = Project.find(params[:project_id])
   end
end

