require 'rails_helper'

RSpec.describe "/stories", type: :request do
  let!(:epic) { Epic.create!(title: "Sample Epic") }
  let!(:story) { Story.create!(title: "Sample Story", description: "Test", status: 0, due_date: Date.today, points: 3, epic: epic) }

  describe "GET /index" do
    it "renders a successful response" do
      get stories_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders the story details" do
      get story_path(story)
      expect(response).to be_successful
      expect(response.body).to include("Sample Story")
    end
  end

  describe "GET /new" do
    it "renders the new story form" do
      get new_story_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders the edit form" do
      get edit_story_path(story)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "creates a new story" do
      expect {
        post stories_path, params: {
          story: {
            title: "New Story",
            description: "Some details",
            status: Story.statuses[:to_do],
            due_date: Date.today + 1.week,
            points: 5,
            epic_id: epic.id
          }
        }
      }.to change(Story, :count).by(1)

      expect(response).to redirect_to(story_path(Story.last))
      follow_redirect!
      expect(response.body).to include("Story was successfully created")
    end
  end

  describe "PATCH /update" do
    it "updates the story" do
      patch story_path(story), params: {
        story: {
          title: "Updated title",
          status: Story.statuses[:done]
        }
      }
      expect(response).to redirect_to(story_path(story))
      story.reload
      expect(story.title).to eq("Updated title")
      expect(story.status).to eq("done")
    end
  end

  describe "DELETE /destroy" do
    it "deletes the story" do
      expect {
        delete story_path(story)
      }.to change(Story, :count).by(-1)
      expect(response).to redirect_to(stories_path)
    end
  end
end
