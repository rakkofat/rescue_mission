require 'rails_helper'

feature "sees question details" do

  let!(:user) { User.create(name: "Jonathan") }
  let!(:question1) { Question.create(title: "What is the meaning of life?", description: "I heard it's 42, but I don't know why!", user: user) }
  let!(:question2) { Question.create(title: "Can I have $5?", description: "No, but seriously.", user: user) }

  scenario "clicks question title on index page" do
    visit questions_path

    click_on(question1.title)

    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.description)
    expect(page).not_to have_content(question2.title)
  end

end
