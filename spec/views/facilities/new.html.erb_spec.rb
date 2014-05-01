require 'spec_helper'

describe "facilities/new" do
  before(:each) do
    assign(:facility, stub_model(Facility,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new facility form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", facilities_path, "post" do
      assert_select "input#facility_title[name=?]", "facility[title]"
      assert_select "textarea#facility_description[name=?]", "facility[description]"
    end
  end
end
