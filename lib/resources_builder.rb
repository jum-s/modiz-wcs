module Modiz
  class ResourcesBuilder
    def initialize(step)
      @resources = step.split("#### Ressources")
                       .last
                       .split("* ")
                       .map(&:strip)
                       .reject(&:empty?)
    end

    attr_reader :to_hash

    def to_hash
      @resources.map do |str|
        { title: title(str),
            url: url(str) }
      end
    end

    private

    def title(resource)
      lines = resource.split("\n")
      lines[0][/[^\[\]]+(?=\])/] # grab every chars between square brackets
    end

    def url(resource)
      lines = resource.split("\n")
      lines[0][/[^\(\)]+(?=\))/] # grab every chars between brackets
    end
  end
end
