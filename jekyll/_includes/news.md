{% comment %}
List of news.
Parameters:
- lang: "en" or "fr", the language used
- on_main: true on index, false on news page
    on main page: only 5 items, no filter
    on news page: all items and filter
{% endcomment %}

{%- assign allnews = site.data.news | sort: "date" | reverse -%}
{%- if include.on_main %}{% assign limit = 5 %}{% else %}

<style>
  {%- for type in site.data.news-types -%}
  .news-{{ type.type }}{ display: none; } p.checkbox:has(#news-{{ type.type }}:checked) ~ dl > .news-{{ type.type }} { display: block; }
  {% endfor %}
</style>

{: .checkbox .center}
**{% if include.lang=="fr" %}Filtrer {%else%}Filter{%endif%}:** {% for type in site.data.news-types %}<input type="checkbox" id="news-{{ type.type }}" checked=true> {{ type.name | lang:include.lang }}
({{ allnews | where: "type", type.type | size }})
{%- unless forloop.last %} &ensp; {% endunless %}{% endfor %}
{% endif %}

{% for news in allnews %}
{: .news-{{ news.type | default: "other" }} } {{ news.date }}
: {: .news-{{ news.type | default: "other" }} }
{%- if news.type == "accepted-paper" %}
  {%- assign nutshell-path = "/research/" | append: news.paper.slug | append: '.html.' | append: include.lang %}
  {%- assign nutshell = site.pages | find: "url", nutshell-path %}
  {%- if nutshell %}
    {%- assign paperurl = nutshell.url %}
  {%- else %}
    {%- assign paperurl = "/research/index.html." | append: include.lang | append: "#" | append: news.paper.slug %}
  {%- endif %} [*{{ news.paper.title }}*]({{ paperurl | relative_url }}) {% if include.lang=="fr" %}a été accepté à{% else %} was accepted at{%endif%} <span title="{{news.paper.venue.fullname}}">{{ news.paper.venue.acronym }} {{ news.paper.year }}</span>
{%- elsif news.type == "conference" or news.type == "summer-school" %} {% if include.lang=="fr" %}Présent à{% else %}Attending{%endif%} {{ news.prefix|lang:include.lang }}{% if news.url %}[{{ news.event | lang: include.lang }}]({{news.url}}){% else %}{{ news.event | lang: include.lang }}{% endif %}{% if news.location %} {% if include.lang=="fr" %}à{% else %}in{%endif%} {{ news.location|lang:include.lang }}{% endif %}
{%- elsif news.type == "invited-talk" %} {% if include.lang=="fr" %}Séminaire invité :{% else %}Invited talk:{%endif%} "{{ news.talk.title }}", {% if news.talk.url %}[{{ news.talk.venue }}]({{news.talk.url}}){% else %}{{ news.talk.venue }}{% endif %}
{%- elsif news.type=="other" %} {{ news.content | lang:include.lang }}
{%- else %} {{ "unknown news type: " | append: news.type | error }}
{%- endif %}
{%- if limit and forloop.index >= limit %}{%break%}{%endif%}
{% endfor %}

{% if include.on_main %}
{: .center }
{% if include.lang=="fr" -%}
[Voir les nouvelles plus anciennes]({{ 'news.html.fr' | relative_url }})
{%- else -%}
[See older news]({{ 'news.html.en' | relative_url }})
{%- endif %}
{% endif %}
