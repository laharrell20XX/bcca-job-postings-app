require "application_system_test_case"

class EmployersTest < ApplicationSystemTestCase
  setup do
    @employer = employers(:one)
  end

  test "visiting the index" do
    visit employers_url
    assert_selector "h1", text: "Employers"
  end

  test "creating a Employer" do
    visit employers_url
    click_on "New Employer"

    fill_in "Company desc", with: @employer.company_desc
    fill_in "Employee count", with: @employer.employee_count
    fill_in "Founded date", with: @employer.founded_date
    fill_in "Headquarters address", with: @employer.headquarters_address
    fill_in "Industry", with: @employer.industry
    fill_in "Logo url", with: @employer.logo_url
    fill_in "Name", with: @employer.name
    click_on "Create Employer"

    assert_text "Employer was successfully created"
    click_on "Back"
  end

  test "updating a Employer" do
    visit employers_url
    click_on "Edit", match: :first

    fill_in "Company desc", with: @employer.company_desc
    fill_in "Employee count", with: @employer.employee_count
    fill_in "Founded date", with: @employer.founded_date
    fill_in "Headquarters address", with: @employer.headquarters_address
    fill_in "Industry", with: @employer.industry
    fill_in "Logo url", with: @employer.logo_url
    fill_in "Name", with: @employer.name
    click_on "Update Employer"

    assert_text "Employer was successfully updated"
    click_on "Back"
  end

  test "destroying a Employer" do
    visit employers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employer was successfully destroyed"
  end
end
