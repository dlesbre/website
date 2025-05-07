---
layout: base
title: Index
permalink: index.html.fr
lang: fr
---

<div class="row">
	<div class="portrait">
		<div class="img"><img src="{{ 'imgs/profil.png' | relative_url }}" alt="Photo"></div>
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
				<dd><a class="link" href="{{ 'files/Dorian_Lesbre_public.pgp' | relative_url }}" download>Clé publique GPG</a><br>
					<a class="link" href="{{ 'files/Dorian_Lesbre_public.pub' | relative_url }}" download>Clé publique SSH</a></dd>
			</dl>
		</div>
	</div>
</div>

## {% include icon.html icon="book" %} Publications

{% include publication_list.html lang="fr" %}
