module Cavy
  class Page < ActiveRecord::Base

    validates :title, uniqueness: true, presence: true

    attr_accessor :tag_string

    before_save :make_route
    before_save :check_render
    before_save :check_content
    before_save :check_tags

    private

    def check_tags
      unless tag_string == '' or tag_string == nil
        self.tags = tag_string.split(',')
      end
    end

    def check_content
      self.content = "" if self.content == nil
    end
    
    def make_route
      self.route = self.title.gsub(' ', '_') if self.route == nil or self.route == ''
    end

    def check_render
      self.render = nil if self.render == ""
    end

  end
end
