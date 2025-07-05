---
layout: base
title: Logiciels
lang: fr
---

# {% include icon.html icon='laptop' %} Logiciels

La plupart de mes projets de programmation sont open-source et disponibles sur
Github (pour mes projets personnels) et sur diverses instances Gitlab (pour mes
projets professionnels ou scolaire).

{: .links }
{% include linkbutton.html url="https://github.com/dlesbre" icon="github" text="Github" lang="en" %}
{%- include linkbutton.html url="https://git.frama-c.com/dlesbre" icon="gitlab" text='Frama-C' lang="en" %}
{%- include linkbutton.html url="https://git.eleves.ens.fr/dlesbre" icon="gitlab" text='ENS' lang="en" %}
{%- include linkbutton.html url="https://gitlab.mpi-sws.org/dlesbre" icon="gitlab" text='MPI' lang="en" %}

{% assign options = "&locale=" | append: page.lang
                  | append: "&bg_color=00000000"
                  | append: "&text_color=ffffff"
                  | append: "&theme=gruvbox" -%}

<div style="text-align: center;">
  <a href="https://github.com/anuraghazra/github-readme-stats">
    <img height=200 title="Github stats" alt="Github stats" class="dark-transparent"
         src="https://github-readme-stats.vercel.app/api?username=dlesbre&hide_rank=true&show_icons=true&include_all_commits=true{{ options }}" />
  </a>
  <a href="https://github.com/anuraghazra/github-readme-stats">
    <img height=200 title="Most used languages" alt="Most used languages" class="dark-transparent"
         src="https://github-readme-stats.vercel.app/api/top-langs/?username=dlesbre&layout=compact&{{ options }}" />
  </a>
</div>

<style>
.badge {
  display: inline-flex;
  font-family: Verdana, sans-serif;
  line-height: 1;
  border-radius: 0.25em;
  overflow: hidden;
  box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
}

.label, .value {
  display: inline-block;
  padding: 4px 6px;
  color: #fff;
}

.label {
  background-color: #555; /* Dark gray */
}
</style>

<div class="badge">
  <span class="label">license</span>
  <span class="value">MIT</span>
</div>

## Compétences informatique

Avancées
: OCaml, Python, GNU Make, Linux, Django, Coq, Voss II.</dd>

Bonnes
: Rust, C, C++, LaTeX, beamer, HTML, CSS, LibreOffice, Windows, Git, Bash, SQL, GIMP, Inkscape, Verilog, Docker.</dd>

Basiques
: JavaScript, TypeScript, assembleur, Blender.</dd>

{% for category in site.data.software %}
## {{ category.title | lang:page.lang }}

{% for project in category.projects %}
- {% include software.md project=project %} {% endfor %}
{% endfor %}
