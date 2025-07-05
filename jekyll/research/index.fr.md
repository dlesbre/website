---
layout: base
lang: fr
title: Recherche
---
{% comment %}
<!-- LTeX: language=fr -->
{% endcomment %}

# Recherche

Mes sujets de recherches sont concentrés autour des langages de programmation
et la vérification de programmes, notamment tous les outils qui permettent de
facilité l’écriture de code correct. Mon sujet de thèse est l’analyse de programme par interprétation abstraite. Plus
spécifiquement, j’étudie des domaines abstraits rapides (non-relationnels ou
faiblement relationnel), comme ceux obtenus par une transformation SSA.
Cependant, je suis aussi intéressé par les systèmes de type, les assistants de preuve,
la programmation fonctionnelle, la compilation, et d'autres sujets.

## {% include icon.html icon='book' %} Publications

{% include publication_list.html lang="fr" %}

## {% include icon.html icon='presenter' %} Séminaires invités

{%- for talk in site.data.talks %}
{{ talk.date }}
: *{{ talk.title }}*, {{ talk.venue | opt_url: talk.url }}
{% endfor %}

## {% include icon.html icon="graduate" %} Enseignement

<div class="timeline content">
	<div class="container"><div class="box">
		<div class="title">Chargé de TP de <a href="{{ 'files/teaching/os-ensta' | relative_url }}">cours de système d'exploitation</a> en 2ème année (niveau M1)</div>
		<div class="place"><a class="link" href="https://www.ensta-paris.fr/" hreflang="fr">ENSTA, Paris</a></div>
		<div class="date">2023-2024 et 2024-2025</div>
	</div></div>
	<div class="container"><div class="box">
		<div class="title">Interrogateur oral en mathématiques au niveau prépa MPSI</div>
		<div class="place"><a class="link" href="https://www.bginette.com/" hreflang="fr">Lycée Ste Geneviève, Versailles</a></div>
		<div class="date">Septembre 2018 &mdash; Juin 2019</div>
	</div></div>
</div>

## Travaux précédents

<div class="timeline content">
	<div class="container"><div class="box">
		<div class="title">Stage de recherche : vérification de programmes concurrents à l'aide d'IRIS</div>
		<div class="place">
			<a class="link" href="https://cs.au.dk/research/logic-and-semantics" hreflang="en">Équipe logique et sémantique, Département d'informatique, Université d'Aarhus, Danemark</a>
		</div>
		<div class="date">Octobre 2022 &mdash; Mars 2023</div>
		<div class="desc">Encadré par Lars Birkedal.<br>
			J’ai défini et étudier une notion de raffinement contextuel de programmes pour une
			machine à capabilités simple
			(<a class="link external" href="https://cs.au.dk/~birke/papers/cerise.pdf" hreflang="en">Cerise</a>).
			Le tout à été formalisé en Coq, en utilisant <a  class="link external" href="https://iris-project.org/" hreflang="en">IRIS</a>.
			<div class="llinks">
				{%- include downloadbutton.html url="/files/internships/Internship_Report_Logsem.pdf" text="Rapport (en)" -%}
				{%- include downloadbutton.html url="/files/internships/Slides_Logsem.pdf" text="Diapositives (en)" -%}
				{%- include downloadbutton.html icon="github"
					url="https://github.com/logsem/cerise/tree/dorian/contextual-refinement"
					text="Preuves coq"
					info='Github logsem/cerise'
				-%}
			</div>
		</div></div>
	</div>
	<div class="container"><div class="box">
		<div class="title">Stage de recherche : vérification de non-interférences des tâches dans un noyau d’OS</div>
		<div class="place">
			<a class="link" href="https://binsec.github.io/" hreflang="en">Équipe BINSEC, CEA List, Paris-Saclay, France</a>
		</div>
		<div class="date">Mars &mdash; Août 2022</div>
		<div class="desc">Encadré par Matthieu Lemerre.<br>
			Par interprétation abstraite sur des noyaux de systèmes d’exploitations, je cherche à montrer
			des propriétés de non-interference entre les tâches. Notamment que les données sont préservée
			et bien restituées lors d’interruptions systèmes.
		</div></div>
	</div>
	<div class="container"><div class="box">
		<div class="title">Stage de recherche : conception d’un processeur sécurisé pour l’IoT</div>
		<div class="place">
			<a class="link" href="https://octopi.chalmers.se/" hreflang="en">Projet Octopi, Chalmers, Suède</a>
		</div>
		<div class="date">Février &mdash; Août 2021}</div>
		<div class="desc">Encadré par Carl Seger.<br>
			Avec l’équipe Céphalopode, conception d’un processeur pour internet des objets visant à permettre
			l’exécution efficace de languages fonctionnels (avec garbage collection automatisé) et supportant l’arithmétique
			sur des entiers de taille arbitraire en hardware.
			<div class="llinks">
        {%- include downloadbutton.html url="/files/internships/Diapos_Stage_Octopi.pdf" text="Diapositives (en)" -%}
			</div>
		</div></div>
	</div>
	<div class="container"><div class="box">
		<div class="title">Stage de recherche : conception et implémentation d’un bootloader sécurisé</div>
		<div class="place">
			<a class="link" href="https://www.provenrun.com/" hreflang="en">Prove & Run, Paris</a>
		</div>
		<div class="date">Mars &mdash; Juillet 2020</div>
		<div class="desc">Encadré par Patrice Hameau.<br>
			Conception et implementation d’un bootloader sécurisé (vérifiant l’intégrité de l’OS
			avant de la lancer et capable de le mettre à jour à partir de fournisseur authentifiés)
			<div class="llinks">
				{%- include downloadbutton.html url="/files/internships/Rapport_Stage_ProveNRun.pdf" text="Rapport" -%}
				{%- include downloadbutton.html url="/files/internships/Diapos_Stage_ProveNRun.pdf" text="Diapositives" -%}
			</div>
		</div></div>
	</div>
	<div class="container"><div class="box">
		<div class="title">Stage de recherche : algorithmes de résolution efficace de systèmes linéaires</div>
		<div class="place">
			<a class="link" href="https://www.lirmm.fr/recherche/equipes/eco" hreflang="fr">Équipe ECO, LIRMM, Montpellier</a>
		</div>
		<div class="date">Juin &mdash; Août 2019</div>
		<div class="desc">Encadré par Pascal Giorgi et Romain Lebreton.<br>
			Étude de la résolution de système d’équations linéaires à coefficients
			entiers ou polynomiaux, notamment d’algorithmes de résolution modulaire qui permettent de gagner en complexité
			lors de la résolution.
			<div class="llinks">
        {%- include downloadbutton.html url="/files/internships/Rapport_Stage_LIRMM.pdf" text="Rapport" -%}
				{%- include downloadbutton.html url="/files/internships/Diapos_Stage_LIRMM.pdf" text="Diapositives" -%}
			</div>
		</div>
	</div></div>
</div>
