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

{% for category in site.data.software %}
### {{ category.title | lang:page.lang }}

{% for project in category.projects %}
- {% assign data = "" -%}
{%- if project.lang -%}
{%-   assign data = data | append: project.lang -%}
{%- endif -%}
{%- if project.repo -%}
      {%- capture text -%}[
        {%- if project.repo contains 'github' -%}
          {% include icon.html icon="github" %}
        {%- else -%}
          {% include icon.html icon="gitlab" %}
        {%- endif %} {% if page.lang == 'fr' %}code source{% else %}source code{% endif %}]({{ project.repo }})
      {%- endcapture -%}
{%-   assign data = data | opt_append: ", " | append: text -%}
{%- endif -%}
{%- if project.license -%}
{%-   assign license = site.data.license[project.license] -%}
{%-   if license -%}
        {%- capture text -%}[{% include icon.html icon="balance" %} {{ project.license }}]({{ license.url }}) {%- endcapture -%}
{%-     assign data = data | opt_append: ", " | append: text -%}
{%-   else -%}
{{-     'Unknown license: ' | append: project.license | error -}}
{%-   endif -%}
{%- endif -%}
{%- capture url -%}{% if project.url %}{% include url.txt url = project.url %}{% endif %}{%-endcapture-%}
{{ project.name | lang:page.lang | opt_url: url }}{{ data | opt_wrap:' (', ')' | default: ' &mdash;' }} {{ project.desc | lang:page.lang -}}{% endfor %}
{% endfor %}
