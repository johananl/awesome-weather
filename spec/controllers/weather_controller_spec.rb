require "rails_helper"

RSpec.describe WeatherController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #search" do
    it "responds successfully with an HTTP 200 status code" do
      get :search, params: {:country => 'DE', :city => 'Berlin'}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "redirects to index when the city cannot be found" do
      get :search, params: {:country => '', :city => 'xxxxxxxxxxxxxxxx'}
      expect(response).to redirect_to '/'
      expect(flash[:alert]).to be_present
    end
  end
end
