# The Gossip Project - Rails app

Apprendre à utiliser le framework Ruby on Rails via une application basique qui gère les potins et les sessions utilisateur.

## Fonctionnalités
- Page d'accueil : tous les potins (auteurs, villes, contenus, nombre de commentaires, nombre de like)
- pour les utilisateurs inscrits : CRUD potins, commentaires, likes


## Installation

Clone repository

Install dépendencies

```bash
  $ bundle install
```

Install Database : create tables

```bash
  $ rails db:create
  $ rails db:migrate
  $ rails db:seed # for seeding
```

To launch server

```bash
  $ bin/rails server
```

## Todo List:

- Gossip: Select tags
- validation email
- validation mots de passe
- message d'alerte
