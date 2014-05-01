require 'spec_helper'

describe "facilities/edit" do
  before(:each) do
    @facility = assign(:facility, stub_model(Facility,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit facility form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", facility_path(@facility), "post" do
      assert_select "input#facility_title[name=?]", "facility[title]"
      assert_select "textarea#facility_description[name=?]", "facility[description]"
    end
  end
end
