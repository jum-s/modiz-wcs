# Bundler et le Gemfile

Quand tu apprends de nouvelles notions, il est bienvenu de déconstruire tes outils
pour comprendre leur fonctionnement interne.

Dans d'autres cas de figure, réinventer la roue plutôt que d'utiliser une librairie
existante qui fait déjà le travail serait une perte de temps.

Dans l'environnement de ruby les librairies de code réutilisables sont paquagées
sous la forme de **gems**.

Voici la définition d'une gem sur [rubygems.org](http://guides.rubygems.org/)

> Gems can be used to extend or modify functionality in Ruby applications. Commonly they’re used to distribute reusable functionality that is shared with other Rubyists for use in their applications and libraries. Some gems provide command line utilities to help automate tasks and speed up your work.

## Objectifs

* Déclarer les dépendances d'un projet dans un `Gemfile`
* Installer les dépendances d'un projet avec bundler
* Trouver et tester une gem

## Etapes

### Gérer les dépendances d'un projet

Plutot que d'installer les dépendances à la main avec `gem install ma_gem` il est beaucoup plus pratique (et recommandé) de lister toutes les dépendances d'un projet dans un fichier nommé `Gemfile` qu'il faut créer à la racine du projet.
Ensuite bundler se chargera de les installer avec `bundle install` exécuté depuis le même dossier.

L'intérêt principal du `Gemfile` est de permettre à d'autres developeurs d'installer rapidement les dépendances du projet pour commencer à travailler dessus.

Que se passe-t-il dans le système de fichiers une fois que la commande `bundle
install` a fini de s'executer ?

#### Ressources

* [Bundler's Purpose and Rationale](http://bundler.io/rationale.html)
  Foo
* [What is the Gemfile](http://tosbourn.com/what-is-the-gemfile/)
  Quand tu spécifies la version d'une gem dans ton Gemfile, quelle est la diférence entre `gem "ma_gem", "~> 2.0"` et `gem "ma_gem", ">= 2.0"` ?
    * `1` si la réponse commence par 'o', 'O', 'y' ou 'Y',
    * `0` si la réponse commence par 'n' ou 'N',
    * `-1` dans tous les autres cas.
* [Ruby toobox](https://www.ruby-toolbox.com/)
  Sachant que n'importe qui peux mettre une gem en ligne, sur quels critères
  peux-tu te baser pour évaluer la pertinence, la qualité et la bonne santé
  d'une gem avant de l'intégrer dans ton projet?

### Calculer son âge en jours

Ecris un programme ruby qui s'execute en console. Le programme commence par
demander à l'utilisateur sa date de naissance au format `JJ/MM/AAAA` puis il 
affiche dans la console l'âge en jours de l'utilisateur.

#### Ressources

* [Documentation ruby Date](http://devdocs.io/ruby/date)

### Ecrire dans un journal

Ecris un programme ruby en console qui demande à l'utilisateur ce qu'il a appris
aujourd'hui. Pour chaque nouvelle réponse le programme ajoute une ligne dans
un fichier `learnings.log`:

~~~
[2015-10-02 11:30] J'ai compris pourquoi et comment faire de l'injection de dépendances dans une classe en ruby
[2015-10-02 18:27] Dans son talk Sandi Metz parle d'une 6ème règle qui autorise à transgresser les 5 autres
~~~

## Challenge

### Encoder du texte dans un QR Code

Ta mission si tu l'acceptes est d'écrire un programme qui transforme une chaîne de caractères en un QRCode. 

En tant qu'utilisateur, quand je lance le programme avec `ruby le_nom_de_mon_fichier.rb`, le programme me demande de saisir du texte dans la console.  
Quand je m'exécute et que je valide, le programme affiche un QRcode en mode texte dans la console généré à partir du texte que j'ai saisi.  
Et le programme génère un fichier `.png` de ce même QRCode qui s'enregistre dans le dossier de l'application.  
**Bonus:** Et le nom du fichier `.png` inclus la date et l'heure de création.

1. Initialise un dépôt git dans un répertoire vide
2. Crée un Gemfile pour installer la gem la plus populaire qui permet d'encoder des QRCodes
3. Crée un fichier `apelle_le_comme_tu_veux.rb` qui contient le script d'exécution du programme
3. Push le tout sur ton compte github
4. Poste le lien vers ton dépôt sur github en guise de solution

### Critères de validation

 * Le QRcode s'affiche dans la console
* Quand je scanne l'image générée je retrouve bien le texte qui a été encodé
* La commande `bundle install` lancée depuis la racine du répertoire installe la gem 
ainsi que ses dépendances
