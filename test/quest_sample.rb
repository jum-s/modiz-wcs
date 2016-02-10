class QuestSample
  attr_reader :load
  def self.load
  # Exemple de structure de données idéale pour une quête
    { quest: {        title: "Bundler et le Gemfile",
                      goals: "Déclarer les dépendances d'un projet",
                description: "Quand tu apprends de nouvelles notions" },
      steps: [ { title: "Gérer les dépendances d'un projet",
                description: "Plutot que d'installer les dépendances à la main",
                resources: [ { title: "What is the Gemfile",
                               url: "http://tosbourn.com/what-is-the-gemfile/",
                               tag: ["foo", "bar", "baz"],
                               description: "si la réponse commence"},
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
      challenge: { title: "Encoder du texte dans un QR Code",
                    description: "Ta mission si tu l'acceptes est d'écrire un programme qui transforme une chaîne de caractères en un QRCode.",
                    criteria: [ "Le QRcode s'affiche dans la console",
                                "Quand je scanne l'image générée je retrouve bien le texte qui a été encodé",
                                "La commande `bundle install` lancée depuis la racine du répertoire installe la gem" ]
                   }
    }
  end
end