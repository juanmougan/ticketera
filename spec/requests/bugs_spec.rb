require 'rails_helper'

RSpec.describe "/bugs", type: :request do
  let(:story) { Story.create!(title: "Story 1", status: 0, epic: Epic.create!(title: "Epic 1")) }

  let(:valid_attributes) do
    {
      title: "Bug A",
      description: "Fix login issue",
      severity: 1,
      status: 0,
      due_date: Date.tomorrow,
      story_id: story.id
    }
  end

  let(:invalid_attributes) do
    {
      title: "",
      severity: nil,
      status: nil
    }
  end

  describe "GET /index" do
    it "returns a successful response" do
      Bug.create!(valid_attributes)
      get bugs_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "shows a bug" do
      bug = Bug.create!(valid_attributes)
      get bug_url(bug)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders the new bug form" do
      get new_bug_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders the edit bug form" do
      bug = Bug.create!(valid_attributes)
      get edit_bug_url(bug)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Bug" do
        expect {
          post bugs_url, params: { bug: valid_attributes }
        }.to change(Bug, :count).by(1)

        expect(response).to redirect_to(Bug.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Bug" do
        expect {
          post bugs_url, params: { bug: invalid_attributes }
        }.not_to change(Bug, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    let(:bug) { Bug.create!(valid_attributes) }

    context "with valid parameters" do
      it "updates the bug and redirects" do
        patch bug_url(bug), params: { bug: { title: "Updated Bug Title" } }
        bug.reload
        expect(bug.title).to eq("Updated Bug Title")
        expect(response).to redirect_to(bug)
      end
    end

    context "with invalid parameters" do
      it "does not update and re-renders edit" do
        patch bug_url(bug), params: { bug: { title: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the bug" do
      bug = Bug.create!(valid_attributes)
      expect {
        delete bug_url(bug)
      }.to change(Bug, :count).by(-1)

      expect(response).to redirect_to(bugs_url)
    end
  end
end
