{%- comment -%}
  Short include to style software list items on the software page.
  Parameters:
  - project: the project object from _data/software.yml
{%- endcomment -%}
{%- assign data = "" -%}
{%- if include.project.lang -%}
{%-   assign data = data | append: include.project.lang -%}
{%- endif -%}
{%- if include.project.repo -%}
      {%- capture text -%}[
        {%- if include.project.repo contains 'github' -%}
          {% include icon.html icon="github" %}
        {%- else -%}
          {% include icon.html icon="gitlab" %}
        {%- endif %} {% if page.lang == 'fr' %}code source{% else %}source code{% endif %}]({{ include.project.repo }})
      {%- endcapture -%}
{%-   assign data = data | opt_append: ", " | append: text -%}
{%- endif -%}
{%- if include.project.license -%}
{%-   assign license = site.data.license[include.project.license] -%}
{%-   if license -%}
        {%- capture text -%}[{% include icon.html icon="balance" %} {{ include.project.license }}]({{ license.url }}) {%- endcapture -%}
{%-     assign data = data | opt_append: ", " | append: text -%}
{%-   else -%}
{{-     'Unknown license: ' | append: include.project.license | error -}}
{%-   endif -%}
{%- endif -%}
{{ include.project.name | lang:page.lang | opt_url: include.project.url }}{{ data | opt_prepend:' (' | opt_append: ')' | default: ' &mdash;' }}
