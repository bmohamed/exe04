part of ex04_example;

class Tache extends ConceptEntity<Tache>
{
  String _nom;
  String etat;
  num numero;
  
  String get nom => _nom;
  set nom(String nom) {
    _nom = nom;
    if (code == null) {
      code = nom;
    }
  
}
  
  Tache newEntity() => 
      new Tache();
  
  Tache copy() {
    var tache = super.copy();
    tache.nom = nom;
    tache.etat = etat;
    tache.numero = numero;
    return tache;
  }

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    nom: ${nom}, \n '
           '    etat: ${etat}\n'
           '    numero: ${numero}\n'
           '  }';
  }
  
 bool get EnAttente =>
      etat.contains('En attente') ? true : false;
  
 bool get EnCours =>
      etat.contains('En cours') ? true : false;

bool get Termine =>
    etat.contains('Terminé') ? true : false;

int getNumero() => 
    (this.numero);

}

class Taches extends ConceptEntities<Tache> {
  Taches newEntities() => new Taches();
  Tache newEntity() => new Tache();
}