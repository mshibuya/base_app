require 'spec_helper'

describe "image_tests/index.html.erb" do
  before(:each) do
    assign(:image_tests, [
      stub_model(ImageTest,
        :name => "Name",
        :body => "MyText",
        :image => "Image"
      ),
      stub_model(ImageTest,
        :name => "Name",
        :body => "MyText",
        :image => "Image"
      )
    ])
  end

  it "renders a list of image_tests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
