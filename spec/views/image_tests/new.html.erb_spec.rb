require 'spec_helper'

describe "image_tests/new.html.erb" do
  before(:each) do
    assign(:image_test, stub_model(ImageTest,
      :name => "MyString",
      :body => "MyText",
      :image => "MyString"
    ).as_new_record)
  end

  it "renders new image_test form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => image_tests_path, :method => "post" do
      assert_select "input#image_test_name", :name => "image_test[name]"
      assert_select "textarea#image_test_body", :name => "image_test[body]"
      assert_select "input#image_test_image", :name => "image_test[image]"
    end
  end
end
