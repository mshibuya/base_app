require 'spec_helper'

describe "image_tests/show.html.erb" do
  before(:each) do
    @image_test = assign(:image_test, stub_model(ImageTest,
      :name => "Name",
      :body => "MyText",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
  end
end
