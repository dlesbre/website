{%- comment -%}
  Short include to style software list items on the software page.
  Parameters:
  - project: the project object from _data/software.yml
{%- endcomment -%}
{{ include.project.name | lang:page.lang | opt_url: include.project.url }}
