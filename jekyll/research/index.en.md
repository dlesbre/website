---
layout: base
title: Research
lang: en
---

# Research

My research interests center around programming languages and program verification,
especially tools that make it easier to write correct code. My PhD focuses on program
verification by abstract interpretation. Specifically, my work centers around fast abstract domains
(non-relational or weakly-relational) obtained by translating to a program to
SSA form. However, I’m also interested in type systems, proof assistants, functional
programming, compilers and more.

## {% include icon.html icon='book' %} Publications

{% include publication_list.html %}

## {% include icon.html icon='presenter' %} Invited Talks

{%- for talk in site.data.talks %}
{{ talk.date }}
: *{{ talk.title }}* at {{ talk.venue | opt_url: talk.url }}
{% endfor %}

## {% include icon.html icon="graduate" %} Teaching

<div class="timeline content">
	<div class="container"><div class="box">
		<div class="title">Teaching assistant for the 2nd year <a href="{{ 'files/teaching/os-ensta' | relative_url }}">operating systems course</a> (M1 level)</div>
		<div class="place"><a class="link" href="https://www.ensta-paris.fr/" hreflang="fr">ENSTA, Paris</a></div>
		<div class="date">2023-2024 and 2024-2025</div>
	</div></div>
	<div class="container"><div class="box">
		<div class="title">Oral mathematics interrogator in preparatory school</div>
		<div class="place"><a class="link" href="https://www.bginette.com/" hreflang="fr">Lycée Ste Geneviève, Versailles</a></div>
		<div class="date">September 2018 &mdash; June 2019</div>
	</div></div>
</div>

## Previous work

<div class="timeline content">
	<div class="container"><div class="box">
		<div class="title">Research internship: verifying concurren programs with IRIS</div>
		<div class="place">
			<a class="link" href="https://cs.au.dk/research/logic-and-semantics" hreflang="en">Logic and semantics team, Department of computer science, Aarhus university, Denmark</a>
		</div>
		<div class="date">October 2022 &mdash; March 2023</div>
		<div class="desc">Supervised by Lars Birkedal.<br>
			I defined and studied a notion of program contextual refinement for a simple
			capability machine (<a class="link external" href="https://cs.au.dk/~birke/papers/cerise.pdf" hreflang="en">Cerise</a>).
			This work was formalized in Coq using <a class="link external" href="https://iris-project.org/">IRIS</a>.
			<div class="llinks">
				{%- include downloadbutton.html url="/files/internships/Internship_Report_Logsem.pdf" text="Report" -%}
				{%- include downloadbutton.html url="/files/internships/Slides_Logsem.pdf" text="Slides" -%}
				{%- include downloadbutton.html icon="github"
					url="https://github.com/logsem/cerise/tree/dorian/contextual-refinement"
					text="Coq proofs"
					info='Github logsem/cerise'
				-%}
			</div>
		</div></div>
	</div>
	<div class="container"><div class="box">
		<div class="title">Research internship: verifying non-interference between tasks in an OS kernel</div>
		<div class="place">
			<a class="link" href="https://binsec.github.io/" hreflang="en">BINSEC Team, CEA List, Paris-Saclay, France</a>
		</div>
		<div class="date">March &mdash; August 2022</div>
		<div class="desc">Supervised by Matthieu Lemerre.<br>
			Using binary-level abstract interpretation on OS kernels, I’m trying to show non-interference
			properties on tasks. Namely that their data is preserved and restored through system interrupts.
		</div></div>
	</div>
	<div class="container"><div class="box">
		<div class="title">Research internship: designing a secure processor for IoT</div>
		<div class="place">
			<a class="link" href="https://octopi.chalmers.se/" hreflang="en">Octopi project, Chalmers, Sweden</a>
		</div>
		<div class="date">February &mdash; August 2021</div>
		<div class="desc">Supervised by Carl Seger.<br>
			As part of the Cephalopode team, design a processor for the internet of thing (IoT) aiming to allow
			efficient execution of functional langages (with garbage collection) and supporting multi-precision arithmetic
			in hardware
			<div class="llinks">
        {%- include downloadbutton.html url="/files/internships/Diapos_Stage_Octopi.pdf" text="Slides" -%}
			</div>
		</div></div>
	</div>
	<div class="container"><div class="box">
		<div class="title">Research internship: design and implementation of a secure bootloaders</div>
		<div class="place">
			<a class="link" href="https://www.provenrun.com/" hreflang="en">Prove &amp; Run, Paris</a>
		</div>
		<div class="date">March &mdash; July 2020</div>
		<div class="desc">Supervised by Patrice Hameau.<br>
			Designed and implemented a secure bootloader, checking the kernel’s integrity and signature
			before booting it, and supporting kernel updates from verified sources.
			<div class="llinks">
        {%- include downloadbutton.html url="/files/internships/Rapport_Stage_ProveNRun.pdf" text="Report (fr)" -%}
				{%- include downloadbutton.html url="/files/internships/Diapos_Stage_ProveNRun.pdf" text="Slides (fr)" -%}
			</div>
		</div></div>
	</div>
	<div class="container"><div class="box">
		<div class="title">Research internship: efficient algorithms to solve linear modular systems</div>
		<div class="place">
			<a class="link" href="https://www.lirmm.fr/lirmm_eng/research/teams/eco" hreflang="en">ECO team, LIRMM, Montpellier</a>
		</div>
		<div class="date">June &mdash; August 2019</div>
		<div class="desc">Supervised by Pascal Giorgi and Romain Lebreton.<br>
			Studied the resolution of linear systems with integer or polynomial coefficients,
			focusing on modular resolution algorithms which allow a small complexity gain in resolution.
			<div class="llinks">
        {%- include downloadbutton.html url="/files/internships/Rapport_Stage_LIRMM.pdf" text="Report (fr)" -%}
				{%- include downloadbutton.html url="/files/internships/Diapos_Stage_LIRMM.pdf" text="Slides (fr)" -%}
			</div>
		</div>
	</div></div>
</div>
