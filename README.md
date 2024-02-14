# The Gossip Project - Rails app

This README would normally document whatever steps are necessary to get the
application up and running.

## Installation

Clone repository

Install dépendencies

```bash
  $ bundle install
```

Install Database : create tables and seed

```bash
  $ rails db:create
  $ rails db:migrate
  $ rails db:seed
```

To launch server

```bash
  $ bin/rails server
```

## Todo List:

- Gossip.destroy : detruire commentaires et likes
- Gossip: Select tags
- système de login / logout avec une page de connexion
- création de potin si l'utilisateur n'est pas connecté. Idem pour show du potin
- destruction des potins
- like gossip show, page ville, 
