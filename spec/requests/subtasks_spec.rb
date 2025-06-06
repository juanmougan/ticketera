require 'rails_helper'

RSpec.describe "/subtasks", type: :request do
  let(:story) { Story.create!(title: "Story 1", status: 0, epic: Epic.create!(title: "Epic 1")) }

  let(:valid_attributes) do
    {
      title: "Subtask A",
      description: "Do something important",
      status: 0,
      due_date: Date.tomorrow,
      story_id: story.id
    }
  end

  let(:invalid_attributes) do
    {
      title: "",
      status: nil
    }
  end

  describe "GET /index" do
    it "returns a successful response" do
      Subtask.create!(valid_attributes)
      get subtasks_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "shows a subtask" do
      subtask = Subtask.create!(valid_attributes)
      get subtask_url(subtask)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders the new subtask form" do
      get new_subtask_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders the edit subtask form" do
      subtask = Subtask.create!(valid_attributes)
      get edit_subtask_url(subtask)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Subtask" do
        expect {
          post subtasks_url, params: { subtask: valid_attributes }
        }.to change(Subtask, :count).by(1)

        expect(response).to redirect_to(Subtask.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Subtask" do
        expect {
          post subtasks_url, params: { subtask: invalid_attributes }
        }.to change(Subtask, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    let(:subtask) { Subtask.create!(valid_attributes) }

    context "with valid parameters" do
      it "updates the subtask and redirects" do
        patch subtask_url(subtask), params: { subtask: { title: "Updated Title" } }
        subtask.reload
        expect(subtask.title).to eq("Updated Title")
        expect(response).to redirect_to(subtask)
      end
    end

    context "with invalid parameters" do
      it "does not update and re-renders edit" do
        patch subtask_url(subtask), params: { subtask: { title: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the subtask" do
      subtask = Subtask.create!(valid_attributes)
      expect {
        delete subtask_url(subtask)
      }.to change(Subtask, :count).by(-1)

      expect(response).to redirect_to(subtasks_url)
    end
  end
end
