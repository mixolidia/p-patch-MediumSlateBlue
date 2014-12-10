class ToolsController < ApplicationController
  before_action :require_admin, only: [:create, :destroy]
  before_action :require_user, only: [:check_in, :check_out]

  def index
    @tools = Tool.all
    @available_tools = Tool.available_tools
    @unavailable_tools = Tool.unavailable_tools
  end

  def manage
    @tool = Tool.new
    @tools = Tool.all
  end

  def create
    failed_tools = []
    tool_params = params[:tool][:name]
    tool_params.each do |tool_name|
      tool = Tool.new(name: tool_name.upcase)
      tool.init
      if tool.save == false
        failed_tools<<tool_name
      end
    end
    #each with if inside can generally be transformed into select
    #failed_tools = saved_tools.select {|key, value| value == false}.keys #reject/value
    if !failed_tools.empty?
      redirect_to manage_tools_path,
        {:notice => "Unable to save #{failed_tools.join(", ")}."}
    else
      redirect_to manage_tools_path
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    if tool.destroy
      redirect_to manage_tools_path
    else
      redirect_to manage_tools_path, {:notice => "Unable to remove tool."}
    end
  end

  def check_out
    tool = Tool.where("id = ? AND available = true", params[:id]).first
    if tool
      tool.set_due_date
      tool.check_out(current_user)
      if tool.save
        redirect_to tools_path, {:notice => "Tool checked out!"}
      else
        redirect_to tools_path, {:notice => "Database Error"}
      end
    else
      redirect_to tools_path, {:notice => "Unable to check out tool"}
    end
  end

  def check_in
    tool = Tool.find(params[:id])
    tool.check_in(current_user)
    if tool.save
      redirect_to tools_path, {:notice => "Tool returned!"}
    else
      redirect_to tools_path, {:notice => "Unable to return tool"}
    end
  end

  def require_admin
    unless current_user.user_is_admin?
      flash[:error] = "You must be an administrator to access this section."
      redirect_to root_path # halts request cycle
    end
  end

  def require_user
    unless current_user
      flash[:error] = "You must be a member to check tools in and out."
      redirect_to root_path
    end
  end
end
