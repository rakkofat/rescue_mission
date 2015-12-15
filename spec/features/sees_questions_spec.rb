require 'rails_helper'

feature "sees questions" do

  let!(:user) { User.create(name: "Jonathan") }
  let!(:question1) { Question.create(title: "What is the meaning of life?", description: "I heard it's 42, but I don't know why!", user: user) }
  let!(:question2) { Question.create(title: "Can I have $5?", description: "No, but seriously.", user: user) }

  scenario "see all the questions" do
    # user = User.create(name: "Jonathan")
    # question1 = Question.create(title: "What is the meaning of life?", description: "I heard it's 42, but I don't know why!", user: user)
    # question2 = Question.create(title: "Can I have $5?", description: "No, but seriously.", user: user)

    visit questions_path
    expect(page).to have_content(question1.title)
    expect(page).to have_content(question2.title)
  end

  scenario "sees questions in order, most recent first" do
    visit questions_path

    expect(page.body.index(question1.title)).to be < page.body.index(question2.title)
  end
end
