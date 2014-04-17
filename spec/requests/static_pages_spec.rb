require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home Page" do

    before { visit root_path }

    it { expect(page).to have_content('Sample App') }
    it { expect(page).to have_title(full_title('')) }
    it { expect(page).to have_title(" | Home")}

    describe "for signed_in user" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: 'Lorem Ipsum')
        FactoryGirl.create(:micropost, user: user, content: 'Dolor sit amet')

        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following count" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end
        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 follower", href: followers_user_path(user)) }
      end
    end

  end

  describe "Help Page" do

    before { visit help_path }

    it { expect(page).to have_content('Help') }
    it { expect(page).to have_title(full_title('')) }
    it { expect(page).to have_title(" | Help") }

  end

  describe "About Page" do

    before { visit about_path }

    it { expect(page).to have_content('About Us') }
    it { expect(page).to have_title(full_title('')) }
    it { expect(page).to have_title(" | About Us") }
  end

  describe "Contact Us" do

    before { visit contact_path }

    it { expect(page).to have_content('Contact') }
    it { expect(page).to have_title(full_title(''))}
    it { expect(page).to have_title(" | Contact") }
  end

end
