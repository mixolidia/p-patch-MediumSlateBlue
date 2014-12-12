require 'rails_helper'

RSpec.describe "calendars/new", :type => :view do
  before(:each) do
    assign(:calendar, Calendar.new(
      :name => "MyString"
    ))
  end

  it "renders new calendar form" do
    render

    assert_select "form[action=?][method=?]", calendars_path, "post" do

      assert_select "input#calendar_name[name=?]", "calendar[name]"
    end
  end
end
