require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home Page" do

    before { visit root_path }

    it { expect(page).to have_content('Sample App') }
    it { expect(page).to have_title(full_title('')) }
    it { expect(page).to have_title(" | Home")}

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
