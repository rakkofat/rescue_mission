require 'rails_helper'

feature "posts new question" do

  scenario "clicks on new question link" do
    visit questions_path

    click_on('New question')

    expect(page).to have_css('form')
    expect(page).to have_content('Ask a new question!')
  end

  scenario "user provides title less than 40 characters" do
    visit new_question_path

    fill_in('Title', :with => 'Breakfast?')
    fill_in('Description', :with => "I'm totally tired of wheat-a-bix.")
    click_button('Create Question')

    expect(page).to have_content('Title is too short')
  end

  scenario "user provides description less than 150 characters" do
    visit new_question_path

    fill_in('Title', :with => 'Breakfast?')
    fill_in('Description', :with => "I'm totally tired of wheat-a-bix.")
    click_button('Create Question')

    expect(page).to have_content('Description is too short')
  end

  scenario "user submits blank form" do
    visit new_question_path
    click_button('Create Question')

    expect(page).to have_content("Title can't be blank")
  end

  scenario "user submits correct form" do
    visit new_question_path

    fill_in('Title', :with => 'Good ideas for breakfast! I am really really hungry!')
    fill_in('Description', :with => "I was totally thinking of having bacon for breakfast, but I'm like totally a vegetarian and stuff and can I like still eat my like bacon and be like a real vegetarian? I don't want to lose my membership card if I accidentally ate bacon. Bacon bacon.")
    click_button('Create Question')

    expect(page).to have_content('Question was successfully created.')
  end

end
