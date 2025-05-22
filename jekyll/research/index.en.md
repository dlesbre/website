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

{% include publication_list.html lang="en" %}

## {% include icon.html icon='presenter' %} Invited Talks

{%- for talk in site.data.talks %}
{{ talk.date }}
: "{{ talk.title }}" at {% if talk.url %}[{{ talk.venue }}]({{talk.url}}){% else %}{{ talk.venue }}{% endif %}
{% endfor -%}
