---
layout: base
lang: fr
title: Recherche
---
{% comment %}
<!-- LTeX: language=fr -->
{% endcomment %}

# Recherche

Mes sujets de recherches sont concentrés autour des langages de programmation
et la vérification de programmes, notamment tous les outils qui permettent de
facilité l’écriture de code correct. Mon sujet de thèse est l’analyse de programme par interprétation abstraite. Plus
spécifiquement, j’étudie des domaines abstraits rapides (non-relationnels ou
faiblement relationnel), comme ceux obtenus par une transformation SSA.
Cependant, je suis aussi intéressé par les systèmes de type, les assistants de preuve,
la programmation fonctionnelle, la compilation, et d'autres sujets.

## {% include icon.html icon='book' %} Publications

{% include publication_list.html lang="fr" %}

## {% include icon.html icon='presenter' %} Séminaires invités

{%- for talk in site.data.talks %}
{{ talk.date }}
: "{{ talk.title }}", {% if talk.url %}[{{ talk.venue }}]({{talk.url}}){% else %}{{ talk.venue }}{% endif %}
{% endfor -%}
