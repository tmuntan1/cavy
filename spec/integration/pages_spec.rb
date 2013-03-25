require 'spec_helper'

module Cavy
  describe 'Pages' do
    before(:each) do
      @page = Page.create(title: 'home', content: 'foobar')
    end

    after(:each) do
      @page.destroy
    end

    it "should be able to go to the home page" do
      visit '/'
      page.should have_content('foobar')
    end

    it "should be able to click link to new page from home page" do
      @about = Page.create(title: 'about', content: 'foo_about_bar')
      visit '/'
      click_link 'about'
      page.should have_content('foo_about_bar')
      @about.destroy
    end

    it "should send the link for the root path back to the root when clicked" do
      visit '/'
      click_link 'home'
      current_path.should == '/'
    end

    it "should render content with cavy/pages/render if no other render was specified" do
      visit '/'
      page.should have_content('foobar')
    end

    it "should be able to change render" do
      @page.update(render: 'cavy_test/pages/test')
      visit '/'
      page.should have_content(@page.title.upcase)
    end

  end
end