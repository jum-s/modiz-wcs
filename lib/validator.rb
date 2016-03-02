module Modiz
  class Validator
    def initialize quest_file
      @quest_file = quest_file
      validate_links
      validate_double_lines_jump
    end

    def self.run quest_file
      new quest_file
    end

    def validate_links
      invalid_urls = every_urls.map do |url|
        valid_format?(url) ? nil : url
      end.compact
      raise InvalidQuest::InvalidLink.new invalid_urls.join(', ') if invalid_urls.any?
    end

    def validate_double_lines_jump
      title_parts = @quest_file.split "\n##"
      title_parts.pop
      title_parts.each do |title_part|
        raise InvalidQuest::DoubleLineMissing.new(wrong_lines_index(title_part)) if title_part[-1] != "\n"
      end
    end

    private

    def wrong_lines_index title_part
      @quest_file.lines.map do |line|
        @quest_file.lines.index(line) if line.include?(title_part.lines.last)
      end.compact
    end

    def every_urls
      @quest_file.lines.map{|url| url.scan(/]\(([^)]+)\)/)}.flatten
    end

    def valid_format? url
      url.match(/https?:\/\/[\S]+/) ? true : false
    end
  end
end