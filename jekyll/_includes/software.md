{%- comment -%}
  Short include fot the common en/fr content of the software page
{%- endcomment -%}

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
         src="https://github-readme-stats.vercel.app/api/top-langs/?username=dlesbre&layout=compact&hide=Haskell{{ options }}" />
  </a>
</div>

## {% if page.lang=="fr" %}Compétences informatique{% else %}Known languages and tools{% endif %}

{% if page.lang=="fr" %}Avancées{% else %}Advanced{% endif %}
: OCaml, Python, GNU Make, Linux, Django, Coq, Voss II.

{% if page.lang=="fr" %}Bonnes{% else %}Good{% endif %}
: Rust, C, C++, LaTeX, beamer, HTML, CSS, LibreOffice, Windows, Git, Bash, SQL, GIMP, Inkscape, Verilog, Docker.

{% if page.lang=="fr" %}Basiques{% else %}Basic{% endif %}
: JavaScript, TypeScript, {% if page.lang=="fr" %}assembleur{% else %}assembly{% endif %}, Blender.

## {% if page.lang=="fr" %}Projets{% else %}Projects{% endif %}

{% if page.lang=="fr" -%}
  {% assign license_txt="Licence" %}
  {% assign lang_txt="Langage" %}
{%- else -%}
  {% assign license_txt="License" %}
  {% assign lang_txt="Language" %}
{%- endif -%}

{% for category in site.data.software %}
### {{ category.title | lang:page.lang }}

{% for project in category.projects %}
- {% assign data = "" -%}
{%- if project.lang -%}
  {%- assign bg="#339" -%}
  {%- for lang in site.data.colors -%}
    {%- if project.lang contains lang.name -%}
      {%- assign bg=lang.color -%}
      {%- break -%}
    {%- endif -%}
  {%- endfor -%}
  {%- capture text -%}{% include badge.html label=lang_txt text=project.lang bg=bg %}{%- endcapture -%}
  {%- assign data = text -%}
{%- endif -%}
{%- if project.repo -%}
  {%- if project.repo contains 'github' -%}
    {%- capture text -%}{% include icon.html icon="github" %} {{  project.repo | strip_prefix: "https://github.com/" | strip_suffix:"/" }}{%- endcapture -%}
    {%- assign bg = "#33c" -%}
  {%- else -%}
    {%- capture text -%}{% include icon.html icon="gitlab" %} {{  project.repo | strip_prefix: "https://" | strip_suffix: "/" }}{%- endcapture -%}
    {%- assign bg = "#c83" -%}
  {%- endif -%}
  {%- capture text -%}{% include badge.html label="Source" url=project.repo text=text bg=bg %}{%- endcapture -%}
{%-   assign data = data | opt_append: " " | append: text -%}
{%- endif -%}
{%- if project.license -%}
{%-   assign license = site.data.license[project.license] -%}
{%-   if license -%}
      {%- capture text -%}
      {% include badge.html label=license_txt url=license.url text=project.license bg=license.color %}
      {%- endcapture -%}
{%-     assign data = data | opt_append: " " | append: text -%}
{%-   else -%}
{{-     'Unknown license: ' | append: project.license | error -}}
{%-   endif -%}
{%- endif -%}
{%- capture url -%}{% if project.url %}{% include url.txt url = project.url %}{% endif %}{%-endcapture-%}
**{{ project.name | lang:page.lang | opt_url: url }}** {{ project.desc | lang:page.lang | opt_prepend: " &mdash; " }}{{ data | opt_prepend: "<br>" }}

{% endfor %}
{% endfor %}
