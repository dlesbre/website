{%- comment -%}
  Short include to style software list items on the software page.
  Parameters:
  - project: the project object from _data/software.yml
{%- endcomment -%}
{% if include.project.url %}[{{ include.project.name | lang:page.lang }}]({{ include.project.url }}){% else %}{{ include.project.name | lang:page.lang }}{% endif %}
