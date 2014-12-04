class ToolsController < ApplicationController
  def create
    tool = Tool.new(params.require(:tool).permit(:name))
    tool.available = true
    if tool.save
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
    tool.available = false
    tool.borrower = current_user.id
    if tool.save
      redirect_to tools_path, {:notice => "Tool checked out!"}
    else
      redirect_to tools_path, {:notice => "Unable to check out tool"}
    end
  end

  def check_in
    tool = Tool.find(params[:id])
    tool.available = true
    tool.borrower = nil
    if tool.save
      redirect_to tools_path, {:notice => "Tool returned!"}
    else
      redirect_to tools_path, {:notice => "Unable to return tool"}
    end
  end
end
