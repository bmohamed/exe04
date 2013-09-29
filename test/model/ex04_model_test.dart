import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:ex04/ex04.dart';

TestTaches(Taches taches){
  
  group("Test sur les taches", () {
    setUp(() {
      var nombreDeTaches = 0;
      expect(taches.length, equals(nombreDeTaches));
       
  var exercice = new Tache();
  expect(exercice,isNotNull);
  exercice.nom = 'Finir l exercice 4';
  exercice.etat = 'En cours';
  exercice.numero = 1;
  taches.add(exercice);
  
  expect(taches.length, equals(++nombreDeTaches));

  var projet = new Tache();
  expect(projet,isNotNull);
  projet.nom = 'Relire les notes du cours';
  projet.etat = 'En attente';
  projet.numero = 2;
  taches.add(projet);
  
  expect(taches.length, equals(++nombreDeTaches));
   
  var rapport = new Tache();
  expect(rapport,isNotNull);
  rapport.nom = 'Ecrire le rapport de stage';
  rapport.etat = 'Terminé';
  rapport.numero = 3;
  taches.add(rapport);
  
  expect(taches.length, equals(++nombreDeTaches));

  var envoiTravail = new Tache();
  expect(envoiTravail,isNotNull);
  envoiTravail.nom = 'Envoyer le travail sur capsul';
  envoiTravail.etat = 'Terminé';
  envoiTravail.numero = 4;
  taches.add(envoiTravail);
  
  expect(taches.length, equals(++nombreDeTaches));

  var effectuerLesTest = new Tache();
  expect(effectuerLesTest,isNotNull);
  effectuerLesTest.nom = 'Effectuer les testes pour les entitées du modele : tache';
  effectuerLesTest.etat = 'En cours';
  effectuerLesTest.numero = 5;
  taches.add(effectuerLesTest);
  
  expect(taches.length, equals(++nombreDeTaches));
  
  var projetDeMemoire = new Tache();
  expect(projetDeMemoire,isNotNull);
  projetDeMemoire.nom = 'Terminer le projet de mémoire à la date prévu';
  projetDeMemoire.etat = 'En cours';
  projetDeMemoire.numero = 6;
  taches.add(projetDeMemoire);
  
  expect(taches.length, equals(++nombreDeTaches));
  
  var mettreAJourLExercice = new Tache();
  expect(mettreAJourLExercice,isNotNull);
  mettreAJourLExercice.nom = 'Mettre à jour l exercice sur github';
  mettreAJourLExercice.etat = 'En attente';
  mettreAJourLExercice.numero = 7;
  taches.add(mettreAJourLExercice);
  
  expect(taches.length, equals(++nombreDeTaches));
});
  
    tearDown(() {
      taches.clear();
      expect(taches.isEmpty, isTrue);
    });
    
    test('Toutes les taches doivent avoir un nom et un etat', () {
      expect(taches.every((p) => p.nom != null), isTrue);
      expect(taches.every((p) => p.etat != null), isTrue);
    });
      
    test('test de la fonction copie', () {
      Taches versionCoipeeDeTaches = taches.copy();
      expect(versionCoipeeDeTaches.isEmpty, isFalse);
      expect(versionCoipeeDeTaches.length, equals(taches.length));
      versionCoipeeDeTaches.forEach((x) =>
          expect(x, isNot(same(taches.find(x.nom)))));
      versionCoipeeDeTaches.display('test de la fonction copie');
    });    

    test ('Chaque tache doit avoir un numéro unique',(){
      Taches versionCoipeeDeTaches = taches.copy();
      int x=0;
      int s;
     for (var t in taches) {
       taches.forEach((r)=> s=r.getNumero());
       if (t.getNumero()==s)
            x++;
     }
      expect(x,equals(1));
    });
    
    test('faire une copie et y ajouter une tache',(){
      Taches versionCoipeeDeTaches = taches.copy();
      Tache nouvelleTache = new Tache();
      versionCoipeeDeTaches.add(nouvelleTache);
      expect(versionCoipeeDeTaches.length,equals(taches.length+1));          
    });
    
    test('Sélection par nom',(){
      var nomRecherche = 'Relire les notes du cours';
      var tache = taches.find(nomRecherche);
      expect(tache,isNotNull);
      expect(tache.nom, equals(nomRecherche));
      tache.display('Sélection par nom');
    });    
    
    
    test('Ordonner les taches par nom', () {
      taches.orderByFunction((m,n) => m.compareTo(n));
      taches.display('Ordonner les taches par nom');
    });
    
    
    test ('liste des taches en attentes', (){
      var tacheEnAttente = taches.select((x) => x.EnAttente);
      expect(tacheEnAttente.isEmpty, isFalse);
      expect(tacheEnAttente.length, equals(2));
      tacheEnAttente.display('liste des taches en attentes');
  });
    
    
    test ('liste des taches términées', (){
      var tacheEnAttente = taches.select((x) => x.Termine);
      expect(tacheEnAttente.isEmpty, isFalse);
      expect(tacheEnAttente.length, equals(2));
      tacheEnAttente.display('liste des taches términées');
  });
  
    
    test ('liste des taches en cours', (){
      var tacheEnAttente = taches.select((x) => x.EnCours);
      expect(tacheEnAttente.isEmpty, isFalse);
      expect(tacheEnAttente.length, equals(3));
      tacheEnAttente.display('liste des taches en cours');
  });  
    
    test('trouver et supprimer une tache',(){
      String nomTacheASupprimer = 'Terminer le projet de mémoire à la date prévu';
      Tache tacheASupprimer= taches.find(nomTacheASupprimer);
      taches.remove(tacheASupprimer);
      tacheASupprimer= taches.find(nomTacheASupprimer);
      expect(tacheASupprimer,isNull);
    });
       
    test('Ajouter une tache identique à une tache existante', () {
      var tache = new Tache();
      expect(tache, isNotNull);
      tache.nom = 'Terminer le projet de mémoire à la date prévu';
      var added = taches.add(tache);
      expect(added, isFalse);
      taches.display('Ajouter une tache identique à une tache existante');
    });
    
  });  
}

initDisplayModel() {
  TacheModel tacheModel = new TacheModel();
  tacheModel.init();
  tacheModel.display();
}

testModel() {
  TacheModel tacheModel = new TacheModel();
  Taches taches = tacheModel.taches;
  TestTaches(taches);
}

main() {
  testModel();
}