require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  user = User.create(user_name: "richard", password: "hi@e.com", password_confirmation: "hi@e.com", email: "richard@example.com")

  describe "account confirmation email" do
    let(:mail) { UserMailer.account_confirmation(user) }

    it "is sent" do
      expect(mail.subject).to eq("Thanks for joining Delistcious!")
      expect(mail.from).to eq(["miriam@example.com"])
    end
  end

  describe "password reset email" do
    let(:mail) { UserMailer.password_reset(user) }

    it "is sent" do
      expect(mail.subject).to eq("Your Delistcious password has been reset")
      expect(mail.from).to eq(["miriam@example.com"])
    end
  end
end