part of ex04_example;

class TacheModel extends ConceptModel{
  
  static final String tache = 'tache';

  Map<String, ConceptEntities> newEntries() {
    var taches = new Taches();
    var map = new Map<String, ConceptEntities>();
    map[tache] = taches;
    return map;
}
  
  Taches get taches => getEntry(tache);
  
  init()
  {
    var exercice = new Tache();
    exercice.nom = 'Finir l exercice 4';
    exercice.etat = 'En cours';
    exercice.numero = 1;
   
    taches.add(exercice);
    
    var projet = new Tache();
    projet.nom = 'Relire les notes du cours ';
    projet.etat = 'En attente';
    projet.numero = 2;
   
    taches.add(projet);
    
    var rapport = new Tache();
    rapport.nom = 'Ecrire le rapport de stage';
    rapport.etat = 'Terminé';
    rapport.numero = 3;
   
    taches.add(rapport);
  }
  
  display()
  {
    print('Tache Model');
    print('=============');
    taches.display('Taches');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }
  
}