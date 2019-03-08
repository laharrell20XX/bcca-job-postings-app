require "application_system_test_case"

class JobPostingsTest < ApplicationSystemTestCase
  setup do
    @job_posting = job_postings(:one)
  end

  test "visiting the index" do
    visit job_postings_url
    assert_selector "h1", text: "Job Postings"
  end

  test "creating a Job posting" do
    visit job_postings_url
    click_on "New Job Posting"

    fill_in "Benefits", with: @job_posting.benefits
    fill_in "Employer", with: @job_posting.employer_id
    fill_in "Location", with: @job_posting.location
    fill_in "Position desc", with: @job_posting.position_desc
    fill_in "Position name", with: @job_posting.position_name
    click_on "Create Job posting"

    assert_text "Job posting was successfully created"
    click_on "Back"
  end

  test "updating a Job posting" do
    visit job_postings_url
    click_on "Edit", match: :first

    fill_in "Benefits", with: @job_posting.benefits
    fill_in "Employer", with: @job_posting.employer_id
    fill_in "Location", with: @job_posting.location
    fill_in "Position desc", with: @job_posting.position_desc
    fill_in "Position name", with: @job_posting.position_name
    click_on "Update Job posting"

    assert_text "Job posting was successfully updated"
    click_on "Back"
  end

  test "destroying a Job posting" do
    visit job_postings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job posting was successfully destroyed"
  end
end
