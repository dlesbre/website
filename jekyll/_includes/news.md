{% comment %}
List of news.
Parameters:
- lang: "en" or "fr", the language used
{% endcomment %}

{% assign allnews = site.data.news | sort: "date" | reverse %}
{% for news in allnews %}
{{ news.date }}
:
{%- if news.type == "accepted-paper" %}
  {%- assign nutshell-path = "/research/" | append: news.paper.slug | append: '.html.' | append: include.lang %}
  {%- assign nutshell = site.pages | find: "url", nutshell-path %}
  {%- if nutshell %}
    {%- assign paperurl = nutshell.url %}
  {%- else %}
    {%- assign paperurl = "/research/index.html." | append: include.lang | append: "#" | append: news.paper.slug %}
  {%- endif %} [*{{ news.paper.title }}*]({{ paperurl | relative_url }}) {% if include.lang=="fr" %}a été accepté à{% else %} was accepted at{%endif%} <span title="{{news.paper.venue.fullname}}">{{ news.paper.venue.acronym }} {{ news.paper.year }}</span>
{%- elsif news.type == "attending" %} {% if include.lang=="fr" %}Présent à{% else %}Attending{%endif%} {{ news.prefix|lang:include.lang }}{% if news.url %}[{{ news.event | lang: include.lang }}]({{news.url}}){% else %}{{ news.event | lang: include.lang }}{% endif %}{% if news.location %} {% if include.lang=="fr" %}à{% else %}in{%endif%} {{ news.location|lang:include.lang }}{% endif %}
{%- elsif news.type %}{{ "unknown news type: " | append: news.type | error }}
{%- else %} {{ news.content | lang:include.lang }}
{%- endif %}
{% endfor %}
