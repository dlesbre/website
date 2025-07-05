---
layout: base
title: Software
lang: en
---
{% comment %}
<!-- LTeX: language=en-US -->
{% endcomment %}


# {% include icon.html icon='laptop' %} Software

Most of my programming project are open-source and available on Github (for my
personal projects) or various Gitlab instances (for professional or scholarly projects).

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

## Known languages and tools

Advanced
: OCaml, Python, GNU Make, Linux, Django, Coq, Voss II.</dd>

Good
: Rust, C, C++, LaTeX, beamer, HTML, CSS, LibreOffice, Windows, Git, Bash, SQL, GIMP, Inkscape, Verilog, Docker.</dd>

Basic
: JavaScript, TypeScript, assembly, Blender.</dd>

{% for category in site.data.software %}
## {{ category.title | lang:page.lang }}

{% for project in category.projects %}
- {% include software.md project=project %}{% endfor %}
{% endfor %}
