require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  it "handles a missing project correctly" do
    get :show, id: "not-here"

    expect(response).to redirect_to(projects_path)
    expect(flash[:alert]).to eq "The project you were looking for could not be found."
  end

  it "handles permission errors by redirecting to a safe place" do
    allow(controller).to receive(:current_user)

    project = FactoryGirl.create(:project)
    get :show, id: project

    expect(response).to redirect_to(root_path)
    expect(flash[:alert]).to eq "You aren't allowed to do that."
  end
end
