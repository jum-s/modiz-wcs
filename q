
[1mFrom:[0m /home/vinny/wcs/github/modiz/lib/quest_builder.rb @ line 39 Modiz::QuestBuilder#validations:

    [1;34m35[0m: [32mdef[0m [1;34mvalidations[0m
    [1;34m36[0m:   [32mif[0m title.empty?
    [1;34m37[0m:     raise [1;34;4mInvalidQuest[0m, [31m[1;31m"[0m[31mLe fichier n'a pas de titre de quête. Ce doit être la première ligne du fichier et commencer par '# '[1;31m"[0m[31m[0m
    [1;34m38[0m:   [32mend[0m
 => [1;34m39[0m:     binding.pry
    [1;34m40[0m: 
    [1;34m41[0m:   [32mif[0m goals.empty?
    [1;34m42[0m:     raise [1;34;4mInvalidQuest[0m, [31m[1;31m"[0m[31mLe fichier n'a pas d'objectif. La Quête doit contenir une liste objectifs avant la section Etapes [1;31m"[0m[31m[0m
    [1;34m43[0m:   [32mend[0m
    [1;34m44[0m: 
    [1;34m45[0m:   [32mif[0m description.empty?
    [1;34m46[0m:     raise [1;34;4mInvalidQuest[0m, [31m[1;31m"[0m[31mLe fichier n'a pas de description de quêtes. Donnez un peu de contexte tout de même ![1;31m"[0m[31m[0m
    [1;34m47[0m:   [32mend[0m
    [1;34m48[0m: [32mend[0m

