class ToolsController < ApplicationController

  def index
    @available_tools = Tool.available_tools
    @unavailable_tools = Tool.unavailable_tools
  end

  def manage
    @tool = Tool.new
    @tools = Tool.all
  end

  def create
    @tool = Tool.new(params.require(:tool).permit(:name))
    @tool.init
    if @tool.save
      redirect_to tools_path
    else
      redirect_to tools_path, {:notice => "Unable to add new tool."}
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    if tool.destroy
      redirect_to tools_path
    else
      redirect_to tools_path, {:notice => "Unable to remove tool."}
    end
  end

  def check_out
    tool = Tool.find(params[:id])
    tool.set_due_date
    tool.check_out(current_user)
    if tool.save
      redirect_to tools_path, {:notice => "Tool checked out!"}
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

end
