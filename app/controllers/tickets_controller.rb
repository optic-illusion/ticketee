class TicketsController < ApplicationController
  before_filter :find_project
  before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render :action => :edit
    end
  end

  def destroy
    if @ticket.destroy
      flash[:notice] = "Ticket has been deleted."
      redirect_to @project
    else
      flash[:alert] = "Ticket has not been deleted."
      render :action => :show
    end
  end

  private
    def find_project
      @project = Project.find_by_id(params[:project_id])
    end
    def find_ticket
      @ticket = @project.tickets.find_by_id(params[:id])
    end
end
