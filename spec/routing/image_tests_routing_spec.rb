require "spec_helper"

describe ImageTestsController do
  describe "routing" do

    it "routes to #index" do
      get("/image_tests").should route_to("image_tests#index")
    end

    it "routes to #new" do
      get("/image_tests/new").should route_to("image_tests#new")
    end

    it "routes to #show" do
      get("/image_tests/1").should route_to("image_tests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/image_tests/1/edit").should route_to("image_tests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/image_tests").should route_to("image_tests#create")
    end

    it "routes to #update" do
      put("/image_tests/1").should route_to("image_tests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/image_tests/1").should route_to("image_tests#destroy", :id => "1")
    end

  end
end
