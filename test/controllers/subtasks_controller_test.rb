require "test_helper"

class SubtasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subtask = subtasks(:one)
  end

  test "should get index" do
    get subtasks_url
    assert_response :success
  end

  test "should get new" do
    get new_subtask_url
    assert_response :success
  end

  test "should create subtask" do
    assert_difference("Subtask.count") do
      post subtasks_url, params: { subtask: { description: @subtask.description, due_date: @subtask.due_date, status: @subtask.status, story_id: @subtask.story_id, title: @subtask.title } }
    end

    assert_redirected_to subtask_url(Subtask.last)
  end

  test "should show subtask" do
    get subtask_url(@subtask)
    assert_response :success
  end

  test "should get edit" do
    get edit_subtask_url(@subtask)
    assert_response :success
  end

  test "should update subtask" do
    patch subtask_url(@subtask), params: { subtask: { description: @subtask.description, due_date: @subtask.due_date, status: @subtask.status, story_id: @subtask.story_id, title: @subtask.title } }
    assert_redirected_to subtask_url(@subtask)
  end

  test "should destroy subtask" do
    assert_difference("Subtask.count", -1) do
      delete subtask_url(@subtask)
    end

    assert_redirected_to subtasks_url
  end
end
