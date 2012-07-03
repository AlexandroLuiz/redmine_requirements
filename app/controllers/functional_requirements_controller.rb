class FunctionalRequirementsController < ApplicationController
  unloadable

 layout 'base'
 menu_item :requirements
 #filter the current project
 before_filter :current_project
 #filtro para analizar as permições para o metodo index
 before_filter :authorize, :only => [:index, :show, :new, :edit, :destroy, :move ]

  require 'pdf_helper'
  include PDFHelper

  # GET /functional_requirements
  # GET /functional_requirements.xml
  def index
    @functional_requirements = FunctionalRequirement.find_all_by_project_id(@project.id)#@project.functional_requirements

    #pagination
      @functional_requirement_count = @functional_requirements.size
      @functional_requirement_pages = Paginator.new self, @functional_requirement_count, per_page_option, params['page']
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @functional_requirements }
      format.pdf {send_data(functional_requirements_to_pdf, :type => 'application/pdf', :filename => "#{@project}-#{t(:functional_requirements)} #{Date.today}.pdf")}
    end
  end

  # GET /functional_requirements/1
  # GET /functional_requirements/1.xml
  def show
    @functional_requirement = FunctionalRequirement.find(params[:id])
    @non_functional_requirements = NonFunctionalRequirement.find_all_by_functional_requirement_id(@functional_requirement.id)

     @non_functional_requirement_count = @non_functional_requirements.size
     @non_functional_requirement_pages = Paginator.new self, @non_functional_requirement_count, per_page_option, params['page']
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @functional_requirement }

    end
  end

  # GET /functional_requirements/new
  # GET /functional_requirements/new.xml
  def new
    @functional_requirement = FunctionalRequirement.new

    respond_to do |format|
     format.html { render :action => 'new', :layout => !request.xhr? }
      format.xml  { render :xml => @functional_requirement }
    end
  end

  # GET /functional_requirements/1/edit
  def edit
    @functional_requirement = FunctionalRequirement.find(params[:id])
  end

  # POST /functional_requirements
  # POST /functional_requirements.xml
  def create
    @functional_requirement = FunctionalRequirement.new(params[:functional_requirement])
    @functional_requirement.project_id = @project.id

    respond_to do |format|
      if @functional_requirement.save
        format.html { redirect_to(project_functional_requirements_url, :notice => l(:notice_successful_create)) }
        format.xml  { render :xml => @functional_requirement, :status => :created, :location => @functional_requirement}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @functional_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /functional_requirements/1
  # PUT /functional_requirements/1.xml
  def update
    @functional_requirement = FunctionalRequirement.find(params[:id])
    @functional_requirement.project_id = @project.id
    respond_to do |format|
      if @functional_requirement.update_attributes(params[:functional_requirement])
        format.html { redirect_to(project_functional_requirements_url, :notice => l(:notice_successful_update)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @functional_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /functional_requirements/1
  # DELETE /functional_requirements/1.xml
  def destroy
    @functional_requirement = FunctionalRequirement.find(params[:id])
    @functional_requirement.destroy

    respond_to do |format|
      format.html { redirect_to(project_functional_requirements_url) }
      format.xml  { head :ok }
    end
  end

  def move
    @functional_requirement = FunctionalRequirement.find(params[:id])
    @issue = Issue.new
    @issue.subject = @functional_requirement.name
    @issue.description = @functional_requirement.description
    @issue.project_id = @functional_requirement.project_id

    @issue.save

    redirect_to({:controller => 'issue_moves', :action => 'new', :id => @issue})

  end



   private
   def current_project
      @project = Project.find(params[:project_id])
   end




end

