---
layout: base
title: Index
permalink: index.html.en
lang: en
---


<div class="row">
	<div class="portrait">
		<div class="img"><img src="{{ 'imgs/profil.png' | relative_url }}" alt="Photo"></div>
		<div class="name">Dorian Lesbre</div>
		<div class="desc">PhD student in computer science</div>
		<div class="desc"><a class="link" href="https://binsec.github.io/" hreflang="en">BINSEC team</a></div>
		<div class="desc"><a class="link" href="https://www.cea.fr/paris-saclay/Pages/Accueil.aspx">CEA LIST, Paris-Saclay</a></div>
		<div class="desc">Graduate of <a class="link" href="https://www.ens.psl.eu">ENS Ulm</a></div>
	</div>
	<div class="column">
		<div class="links">
			{% include linkbutton.html url="https://github.com/dlesbre" text="Github" lang="en" %}
			{% include linkbutton.html url="https://orcid.org/0000-0002-4328-6753" text="ORCID" lang="en" %}
			{% include linkbutton.html url="https://www.linkedin.com/in/dorian-lesbre-78a002122" text="Linkedin" lang="en" %}
		</div>
		<div class="links">
			{% include linkbutton.html url="https://git.eleves.ens.fr/dlesbre" icon="gitlab" text="ENS" lang="en" %}
			{% include linkbutton.html url="https://scholar.google.com/citations?user=y1vtAtUAAAAJ" text="Scholar" lang="en" %}
			{% include linkbutton.html url="https://git.frama-c.com/dlesbre" icon="gitlab" text="Frama-C" lang="en" %}
		</div>
		<div class="links">{% include downloadbutton.html url="/files/CV_Dorian_Lesbre_en.pdf" text="Résumé" %}</div>
		<h2>{% include icon.html icon="arobase" %} Contact</h2>
		<div class="contactsheet">
			<dl>
				<dt>{% include icon.html icon="email" %}</dt>
				<dd>
					<strong>work :</strong> dorian.lesbre[at]cea.fr<br>
					<strong>personal :</strong> dorian.lesbre[at]gmail.com
				</dd>
				<dt>{% include icon.html icon="key" %}</dt>
				<dd><a class="link" href="{{ 'files/Dorian_Lesbre_public.pgp' | relative_url }}" download>GPG public key</a><br>
					<a class="link" href="{{ 'files/Dorian_Lesbre_public.pub' | relative_url }}" download>SSH public key</a></dd>
			</dl>
		</div>
	</div>
</div>

## {% include icon.html icon="user" %} About me

I’m a PhD student at the [BINSEC team](https://binsec.github.io/), working from
NanoINNOV at [CEA Paris-Saclay](https://www.cea.fr/paris-saclay/Pages/Accueil.aspx).

My PhD subject is centered around program verification by abstract
interpretation. Specifically, my work centers around fast abstract domains
(non-relational or weakly-relational) obtained by translating to a program to
SSA form. I work under the supervision of [Matthieu Lemerre](https://binsec.github.io/people/lemerre.html).

My research interests focus on verification and low-level systems: formal
methods, abstract interpretation, type systems, Coq, operating systems,
compilers, hardware, functionnal programming and more. Besides computer science,
I also enjoy mathematics and physics.

I like to code in my free time. You can find my personal projects,
such as [bibtex autocomplete&nbsp;{% include icon.html icon="github" %}](https://github.com/dlesbre/bibtex-autocomplete)
or my solutions for [advent of code&nbsp;{% include icon.html icon="github" %}](https://github.com/dlesbre/advent-of-code)
on the [software]({{ 'logiciels.html.en' | relative_url }}) page.

My hobbies include outdoor sports such as rock climbing, sailing, hiking and skiing.
I also enjoy reading, especially sci-fi and detective stories.
You can also find me playing board games and video games.

{% include publication_list.html lang="en" %}

## {% include icon.html icon="link" %} Recommendations

In no particular order, here are a few links ranging from useful software
to some fun games and comics.

### {% include icon.html icon="computer" %} Software

- [KeepassXC](https://keepassxc.org/) is a password manager. It allows you to
  use very secure passwords without fear of forgetting them. I also find it very
  useful to keep my various only accounts in mind, as well as what personal
  information is on each account.
- [Obsidian](https://obsidian.md/) is a note-taking app that is both simple
  (based on markdown files) and very customizable thanks to a large plugin
  ecosystem.
- [Typst](https://typst.app/) is PDF document composer. It is an interesting
  alternative to LaTeX which fixes a good chunk of what I find frustrating with
  TeX.
- [Godbolt](https://godbolt.org/) is a website that can compile small programs
  and show generated assembly. I find the ability to show assembly diff between
  two similar programs very helpful. It allows to quickly see how small changes
  affect the generated code.
- [Syncthing](https://syncthing.net/) is a great, privacy respecting file
  synchronisation tool. I set it up once, and it allows me to move photos and files
  from my phone to my PC very easily.
- [Connected papers](https://www.connectedpapers.com/) website displaying links
  between scientific publications as a graph. Very handy for bibliographic
  exploration.

### {% include icon.html icon="gamepad" %} Video games

- [Kerbal Space Program](https://www.kerbalspaceprogram.com/) is a game for
  space and physics fans! It allows you to design and launch your own rockets.
  It brings you form the joy of managing a difficult lunar landing to the sad realization that you didn’t bring enough fuel to go back home.
- [Outer Wilds](https://store.steampowered.com/app/753640/Outer_Wilds) is an
  exploration game set in a miniature solar system, this gem will take you on a
  memorable journey.
- [Return of the Obra Dinn](https://obradinn.com/) is a short detective game which trusts players to find well hidden clues and make complex deductions.
- [Factorio](https://www.factorio.com/): behind some unattractive graphics,
  factorio hides a very engaging and satisfying game about optimisation and
  logistics. Some might even call it addictive.
