module Modiz
  class ResourcesBuilder
    def initialize resources
      @resources = resources.strip.split("\n* ")
    end

    attr_reader :to_hash

    def to_hash
      @resources.map do |str|
        {       title: title(str),
                  url: url(str),
                  # tags: tags(str), TODO parseur de tags
          description: description(str) }
      end
    end

    private

    def description resource
      description_index = resource.index(")")
      desc = resource[description_index + 1..-1].strip
    end

    def title resource
      btwn_square_brackets resource
    end

    def url resource
      btwn_brackets resource
    end

    def btwn_brackets line
      line[/[^\(\)]+(?=\))/]
    end

    def btwn_square_brackets line
      line[/[^\[\]]+(?=\])/]
    end
  end
end
