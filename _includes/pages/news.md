{% comment %}
List of news.
Parameters:
- on_main: true on index, false on news page
    on main page: only 5 items, no filter
    on news page: all items and filter

The filter uses CSS only:
- items with class `.news-XXX` are hidden by `display:none;`
- When the checkbox with matching is checked, `#news-XXX:checked`, this changes to `display:block;`
This uses the CSS `~` selector (selects two siblings). Since the checkbox (wrapped in a `p`) and
news elements (wrapped in a `dl`) aren't siblings, we need to use more selectors to combine them:
`p:has(#news-XXX:checked) ~ dl > .news-XXX`
{% endcomment %}

{%- assign allnews = site.data.news | sort: "date" | reverse -%}
{%- if include.on_main %}{% assign limit = 5 %}{% else %}

<style>
  {%- for type in site.data.news-types -%}
  .news-{{ type.type }}{ display: none; } p:has(#news-{{ type.type }}:checked) ~ dl > .news-{{ type.type }} { display: block; }
  {%- endfor -%}
</style>

**{% if page.lang=="fr" %}Filtrer {%else%}Filter{%endif%}:** {% for type in site.data.news-types %}{% assign size = allnews | where: "type", type.type | size %}{% if size > 0 %}<span style="white-space:nowrap;"><input type="checkbox" id="news-{{ type.type }}" checked=true /> {{ type.name | lang:page.lang }} ({{ size }})</span>{% endif %}
{%- unless forloop.last %} &ensp; {% endunless %}{% endfor %}
{% endif %}

{% for news in allnews %}

{%- assign year = news.date | date: "%Y" -%}
{%- if year != prevyear and include.on_main != true %}
**{{ year }}**
{% assign prevyear = year %}
{% endif %}

{: .news-{{ news.type | default: "other" }} } {{ news.date }}
: {: .news-{{ news.type | default: "other" }} }

{%- if news.type == "accepted-paper" %}
  {% include icon.html icon="file" %} [*{{ news.paper.title }}*]({% include paper_url.txt slug=news.paper.slug %}) {% if page.lang=="fr" %}a été accepté à{% else %} was accepted at{%endif%} <span title="{{news.paper.venue.fullname}}">{{ news.paper.venue.acronym }} {{ news.paper.year }}</span>
{%- elsif news.type == "conference" or news.type == "summer-school" %} {% if page.lang=="fr" %}Présent{% else %}Attending{%endif%} {{ news.prefix|lang:page.lang }}{{ news.event | lang: page.lang | opt_url: news.url }}{% if news.location %} {% if page.lang=="fr" %}à{% else %}in{%endif%} {{ news.location|lang:page.lang }}{% endif %}
{%- elsif news.type == "award" %} {% include icon.html icon="award" %} {% if page.lang=="fr" %}J’ai eu l’honneur de recevoir le{% else %}I am honored to receive the{% endif %} {{ news.name | lang:page.lang | opt_url: news.url }}{% if news.paper %} {% if page.lang=="fr" %}pour ma publication à{% else %}for my paper at{% endif %} [{{ news.paper.venue.acronym }} {{news.paper.year }}]({% include paper_url.txt slug=news.paper.slug %})
{% endif %}
{%- elsif news.type == "invited-talk" %} {% if page.lang=="fr" %}Séminaire invité :{% else %}Invited talk:{%endif%} *{{ news.talk.title }}*, {{ news.talk.venue | lang:page.lang | opt_url: news.talk.url }}
{%- elsif news.type == "reviewing" %}
  {% if news.subtype == "artifact" %} {% if page.lang=="fr" %}Membre du comité d’évaluation d’artéfacts de {% else %}Artifact evaluation commitee member for {% endif -%}
  {% elsif news.subtype == "subreview" %} {% if page.lang=="fr" %}Sous-reviewer pour {% else %}Subreviewer for {% endif -%}
  {% endif %}
  {% if news.url %}<a href="{{ news.url }}"{{ news.venue | opt_wrap: ' title="', '"' }}>{{ news.venue-acronym }}</a>
  {% elsif news.venue %}<span title="{{ news.venue }}">{{ news.venue-acronym }}</span>
  {% else %}{{ news.venue-acronym }}
  {% endif %}
{%- elsif news.type == "other" %} {{ news.content | lang:page.lang }}
{%- else %} {{ "unknown news type: " | append: news.type | error }}
{%- endif %}
{%- if limit and forloop.index >= limit %}{%break%}{%endif%}
{% endfor %}

{% if include.on_main %}
{: .center }
{% if page.lang=="fr" -%}
[Voir les nouvelles plus anciennes]({% include url.txt url='news.html.fr' %})
{%- else -%}
[See older news]({% include url.txt url='news.html.en' %})
{%- endif %}
{% endif %}
