---
layout: base
title: Index
lang: fr
priority: 0.9
---

<div class="row">
	<div class="portrait">
		<div class="img"><img src="{% include url.txt url='imgs/profil.png' %}" alt="Photo"></div>
		<div class="name">Dorian Lesbre</div>
		<div class="desc">Doctorant en informatique</div>
		<div class="desc"><a class="link" href="https://binsec.github.io/" hreflang="en">Équipe BINSEC</a></div>
		<div class="desc"><a class="link" href="https://www.cea.fr/paris-saclay/Pages/Accueil.aspx">CEA LIST, Paris-Saclay</a></div>
		<div class="desc">Ancien élève de l’<a class="link" href="https://www.ens.psl.eu">ENS Ulm</a></div>
	</div>
	<div class="column">
		<div class="links">
			{% include linkbutton.html url="https://github.com/dlesbre" text="Github" lang="en" %}
			{% include linkbutton.html url="https://orcid.org/0000-0002-4328-6753" text="ORCID" lang="en" %}
			{% include linkbutton.html url="https://www.linkedin.com/in/dorian-lesbre-78a002122" text="Linkedin" lang="fr" %}
		</div>
		<div class="links">
			{% include linkbutton.html url="https://git.eleves.ens.fr/dlesbre" icon="gitlab" text="ENS" lang="en" %}
			{% include linkbutton.html url="https://scholar.google.com/citations?user=y1vtAtUAAAAJ" text="Scholar" lang="en" %}
			{% include linkbutton.html url="https://git.frama-c.com/dlesbre" icon="gitlab" text="Frama-C" lang="en" %}
		</div>
		<div class="links">{% include downloadbutton.html url="/files/CV_Dorian_Lesbre_fr.pdf" text="CV" %}</div>
		<h2>{% include icon.html icon="arobase" %} Contact</h2>
		<div class="contactsheet">
			<dl>
				<dt>{% include icon.html icon="email" %}</dt>
				<dd>
					<strong>pro :</strong> dorian.lesbre[arobase]cea.fr<br>
					<strong>perso :</strong> dorian.lesbre[arobase]gmail.com
				</dd>
				<dt>{% include icon.html icon="key" %}</dt>
				<dd><a class="link" href="{% include url.txt url='files/Dorian_Lesbre_public.pgp' %}" download>Clé publique GPG</a><br>
					<a class="link" href="{% include url.txt url='files/Dorian_Lesbre_public.pub' %}" download>Clé publique SSH</a></dd>
			</dl>
		</div>
	</div>
</div>

## {% include icon.html icon="user" %} Qui suis-je ?

Je suis étudiant en doctorat à l’[équipe BINSEC](https://binsec.github.io/), au
centre NanoINNOV du [CEA Paris-Saclay](https://www.cea.fr/paris-saclay/Pages/Accueil.aspx).
Je travaille sur l’analyse de programme par interprétation abstraite. Plus
spécifiquement, j’étudie des domaines abstraits rapides (non-relationnels ou
faiblement relationnel), comme ceux obtenus par une transformation SSA. Mon
encadrant de thèse est [Matthieu Lemerre](https://binsec.github.io/people/lemerre.html).

Mes travaux récents et publications sont disponibles sur la [page recherche]({% include url.txt url='/research/index.html.fr' %}).

Je m’intéresse notamment à la vérification et l’informatique pratique bas niveau :
méthodes formelles, interprétation abstraite, système de types, Coq, systèmes
d’exploitation, compilation, circuits, programmation fonctionnelle et d’autres.
En dehors de l’informatique, je m’intéresse aussi aux mathématiques et à la
physique.

J’aime aussi programmer dans mon temps libre, vous trouverez sur la page
[logiciels]({% include url.txt url="software/index.html.fr" %}) mes projets
personnels comme [bibtex autocomplete&nbsp;{% include icon.html icon="github" %}](https://github.com/dlesbre/bibtex-autocomplete)
ou mes solutions de l’[advent of code&nbsp;{% include icon.html icon="github" %}](https://github.com/dlesbre/advent-of-code).

Hors du domaine scolaire, j’aime bien faire des sports d’extérieur comme
l’escalade, la voile, la randonnée et le ski. J’aime bien lire, notamment de la
SF et des romans policiers. Je m’occupe également en jouant à des jeux de
société et des jeux vidéos.

## {% include icon.html icon="newspaper" %} Dernières nouvelles

{% include pages/news.md on_main=true %}

## {% include icon.html icon="link" %} Recommandations

Sans ordre particulier, voici quelques liens allant d'outils que j’utilise
régulièrement pour le travail, à des comics et jeux que j’apprécie beaucoup.

### {% include icon.html icon="computer" %} Logiciels

- [KeepassXC](https://keepassxc.org/) (en) est un gestionnaire de mot de passe,
  il permet d’utiliser des mots de passe sécurisés sans risque d’oubli. Je le
	trouve aussi très utile pour garder en mémoire tous mes comptes et les
	informations personnelles associées à chacun.
- [Obsidian](https://obsidian.md/) (en) est une application de prise de notes
	simple (à base de fichiers markdown) et très riche grâce à un bel écosystème
	de greffons.
- [Typst](https://typst.app/) (en) est un logiciel de création de documents
  PDFs. C'est une alternative à LaTeX assez complète qui adresse bon nombre de
  mes frustrations avec TeX.
- [Godbolt](https://godbolt.org/) (en) site web permettant de compiler des
	petits programmes et d'afficher l'assembleur généré. Je trouve la
	visualisation de différences de codes particulièrement utiles pour voir
	l'effet d'un petit changement dans la source sur le code généré.
- [Syncthing](https://syncthing.net/) (en) est un très bon outil de
  synchronisation de fichiers entre plusieurs appareils. Il me permet de passer
  mes photos du téléphone au PC sans même y penser.
- [Zotero](https://www.zotero.org/) est un gestionnaire bibliographique. Il permet
  de regrouper tous les PDFs de publications en un seul endroit avec leurs
  information bibliographique, et d'y rajouter des tags et annotations personnelles.
- [Connected papers](https://www.connectedpapers.com/) (en) site web affichant
  les citations entre publications scientifiques sous forme de graphe. Je le
  trouve très pratique pour l'exploration bibliographique.

### {% include icon.html icon="gamepad" %} Jeux vidéos

- [Kerbal Space Program](https://www.kerbalspaceprogram.com/) est un jeu pour les
  fans de physique et d’espace ! Il permet de concevoir et lancer ses propres
  fusées. Il vous mènera de la satisfaction d'avoir réussi un alunissage compliqué
	à la triste réalisation que non, vous n'avez pas assez de carburant pour rentrer,
	en passant par d'innombrables explosions inopportunes.
- [Outer Wilds](https://store.steampowered.com/app/753640/Outer_Wilds) est un
  jeu d'exploration et de découverte dans un système solaire miniature, il vous
  embarquera pour un voyage inoubliable.
- [Return of the Obra Dinn](https://obradinn.com/) est un court jeu de détective
  qui fait confiance au joueur pour trouver des indices bien dissimulés et faire
  des déductions difficiles.
- [Factorio](https://www.factorio.com/) : derrière ses graphismes peu attirants,
  factorio cache un jeu d’optimisation et de logistique très (trop ?) prenant et
  satisfaisant. Certains diraient même qu'il est addictif.
