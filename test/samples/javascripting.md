# Javascripting

**JavaScript** peut raisonnablement se targuer d'être le langage de programmation le plus incompris au monde. Bien que souvent raillé comme étant un simple jouet, derrière sa simplicité désarmante se cachent certaines fonctionnalités de langage très puissantes. De nombreuses applications JavaScript de premier plan sont apparues, ce qui montre qu'une connaissance approfondie de cette technologie est une compétence importante pour tout développeur Web.

Il peut être utile de commencer avec une idée de l'histoire de ce langage. JavaScript a été créé en 1995 par Brendan Eich, un ingénieur de Netscape, et ce langage est sorti au grand jour pour la première fois avec Netscape 2 au début de l'année 1996. Il était au départ censé s'appeler LiveScript, mais a été renommé par une décision marketing néfaste dans le but de capitaliser sur la popularité du langage Java de Sun Microsystems, malgré le fait qu'ils n'aient que très peu en commun. Cela n'a jamais cessé d'être une source de confusion.

Quelques mois plus tard, Microsoft a lancé avec Internet Explorer 3 une version du langage globalement compatible, appelée JScript. Netscape a soumis le langage à l'Ecma International, une organisation de normalisation européenne, ce qui a permis d'aboutir à la première édition du standard ECMAScript en 1997. Ce standard a reçu une mise à jour importante appelée ECMAScript edition 3 en 1999, et est resté relativement stable depuis. La quatrième édition a été abandonnée suite à des différents portants sur la complexité du langage. De nombreuses sections de la quatrième édition ont été utilisées pour servir de fondation à la cinquième édition d'ECMAScript, publiée en décembre 2009. La sixième édition, qui apporte des nouveautés majeures sera publiée en 2015.

Cette stabilité est une excellente nouvelle pour les développeurs, parce qu'elle a donné aux différentes implémentations tout le temps nécessaire pour s'y adapter.

Contrairement à la plupart des langages de programmation, JavaScript n'a pas de concept d'entrée ou de sortie. Il est conçu pour s'exécuter comme un langage de script dans un environnement hôte, et c'est à cet environnement de fournir des mécanismes de communication avec le monde extérieur. L'environnement hôte le plus commun est un navigateur, mais des interpréteurs JavaScript existent également dans Adobe Acrobat, Photoshop, les images SVG, le moteur de widgets de Yahoo!, et même au sein d'environnements côté serveur tels que node.js. Cette liste ne se limite pas qu'à ces éléments et on retrouve également JavaScript dans les bases de données NoSQL telles que Apache CouchDB, les ordinateurs embarqués ou encore des environnements de bureaux comme GNOME (l'une des interfaces graphiques les plus populaires des systèmes d'exploitation GNU/Linux).

*[Contenu sous license CC-BY-SA 2.5 par les Contributeurs de Mozilla](https://developer.mozilla.org/fr/docs/Web/JavaScript/Une_r%C3%A9introduction_%C3%A0_JavaScript).*

## Objectifs

* Suivre les instructions d'un fichier `README`
* Reconnaitre la syntaxe du language JavaScript
* Ecrire un programme simple en JavaScript

## Etapes

### Javascripting dans le navigateur
Réaliser les 6 exercices d'introduction du tutoriel.

#### Ressources

* [Didacto javascript](http://javascript.didacto.net/)
`javascript` `elearning`

### Javascripting dans le terminal
Après un démarrage dans un environnement familier (le navigateur). La suite de l'aventure se déroule dans le terminal. Une interface texte graphiquement minimaliste, mais qui dispose d'une infinité de fonctionalités pour interagir avec la machine en toute franchise.

#### Ressources

* [Installer node.js et npm](https://gist.github.com/Em-AK/b8a81ecc570548061106)
`javascript`
Vérifie que node.js et npm sont installés sur ta machine
* [NodeSchool javascripting](https://github.com/sethvincent/javascripting)
Installe le module npm `javascripting` en suivant les instructions du fichier `README` et réalise la totalité du tutoriel.

### Javascripting in the sky

#### Ressources

* [Boda boda in the sky](https://www.youtube.com/watch?v=RL6ncOBKx3E)
`javascript` `sky` `bodaboda`
3 min pour respirer
* [Aide mémoire du language JavaScript](http://learnxinyminutes.com/docs/fr-fr/javascript-fr/)
À garder sous le coude quand tu développe en JS
* [Comment insérer un script dans une page HTML](http://javascript.info/tutorial/hello-world)
Créer une page qui affiche le message `JavaScript is fun !`
* [Les interactions de base dans le navigateur](http://javascript.info/tutorial/user-interaction-alert-prompt-and-confirm)
Créer une page qui pose une question fermée (Oui/Non) au visiteur, puis qui affiche une alerte qui contient:
  * `1` si la réponse commence par 'o', 'O', 'y' ou 'Y',
  * `0` si la réponse commence par 'n' ou 'N',
  * `-1` dans tous les autres cas.

### Javascripting sans ressources

Parce qu'il n'y en aura pas toujours
... des ressources.

## Challenge
### Afficher un tas de patates

  1. Créer une page HTML contenant un script qui pose la question `"Hey mon ami ! Tu aimes ça les patates ?"` au visiteur.
  2. Si la réponse est positive afficher un tas de patates de 7 niveaux comme ci-dessous dans la console du navigateur (en utilisant une boucle `for`)
    ```
    #
    ##
    ###
    ####
    #####
    ######
    #######
    ```
    Si la réponse est négative afficher un message de déception dans une alerte. Si la réponse n'est ni positive ni négative, afficher `"Je vous sens comme tirraillé"` dans une alerte.
  3. Versionner votre code dans un Gist
  4. Poster le lien vers votre Gist en guise de solution

### Critères de validation

* Le tas de patates s'affiche en cas de réponse positive
* Le tas de patate fait 7 niveaux de haut.
* Le programme utilise une boucle `for` pour afficher le tas de patate
* Une alerte s'affiche en cas de réponse négative ou indéterminée

