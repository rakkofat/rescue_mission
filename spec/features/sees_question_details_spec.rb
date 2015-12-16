require 'rails_helper'

feature "sees question details" do

  let!(:question1) { Question.create(title: "a"*40, description: "a"*150) }
  let!(:question2) { Question.create(title: "b"*40, description: "b"*150) }

  scenario "clicks question title on index page" do
    visit questions_path

    click_on(question1.title)

    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.description)
    expect(page).not_to have_content(question2.title)
  end

end
