module Blorgh
  class Article < ActiveRecord::Base
    attr_accessor :author_name

    belongs_to :author, class_name: Blorgh.author_class.to_s
    has_many :comments

    before_save :set_author

    private

    def set_author
      self.author = Blorgh.author_class.find_or_create_by(name: author_name)
    end
  end
end
