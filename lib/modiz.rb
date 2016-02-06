require 'modiz/version'
require 'pry'
module Modiz

  class MdToHash
    def initialize(quest_file)
      @lines = quest_file.lines
    end

    def run
      title = @lines.first.tr("#", "").strip
      { quest: { title: title } }
    end
  end
end
