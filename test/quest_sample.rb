class QuestSample
  attr_reader :load
  def self.load
  # Exemple de structure de données idéale pour une quête
    { quest: {        title: "Bundler et le Gemfile",
                      goals: "new quest goals here",
                description: "new quest description here\n another line" },
      steps: [ { title: "step1",
                description: "step1",
                resources: [ { title: "Da best ressource ever",
                               url: "http://www.izap4u.com",
                               tag: ["foo", "bar", "baz"]},
                             { title: "This is da best ressource ever",
                               url: "http://lequipe.fr",
                               tag: ["lulz", "quz"] } ]
                },
                { title: "step2",
                description: "step2",
                resources: [ { title: "Da second best ressource ever",
                               url: "http://anotherwebsite.com",
                               tag: ["buz"]
                              } ]
                } ],
      challenge: { title: "You can do it",
                    description: "Another desc",
                    criteria: [ "this", "and", "that" ]
                   }
    }
  end
end