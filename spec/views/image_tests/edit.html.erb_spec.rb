require 'spec_helper'

describe "image_tests/edit.html.erb" do
  before(:each) do
    @image_test = assign(:image_test, stub_model(ImageTest,
      :name => "MyString",
      :body => "MyText",
      :image => "MyString"
    ))
  end

  it "renders the edit image_test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => image_tests_path(@image_test), :method => "post" do
      assert_select "input#image_test_name", :name => "image_test[name]"
      assert_select "textarea#image_test_body", :name => "image_test[body]"
      assert_select "input#image_test_image", :name => "image_test[image]"
    end
  end
end
