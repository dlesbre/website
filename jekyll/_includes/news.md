{% comment %}
List of news.
Parameters:
- lang: "en" or "fr", the language used
{% endcomment %}

{% assign allnews = site.data.news | sort: "date" | reverse %}
<style>
  .news-other {
    display: none;
  }

  p:has(#news-other:checked) ~ dl > .news-other {
    display: block;
  }
</style>

<input type="checkbox" id="news-other" checked=true> Other

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
{%- elsif news.type == "attending" %} {% if include.lang=="fr" %}Présent à{% else %}Attending{%endif%} {{ news.prefix|lang:include.lang }}{% if news.url %}[{{ news.event | lang: include.lang }}]({{news.url}}){% else %}{{ news.event | lang: include.lang }}{% endif %}{% if news.location %} {% if include.lang=="fr" %}à{% else %}in{%endif%} {{ news.location|lang:include.lang }}{% endif %}
{%- elsif news.type == "invited-talk" %} {% if include.lang=="fr" %}Séminaire invité :{% else %}Invited talk:{%endif%} "{{ news.talk.title }}", {% if news.talk.url %}[{{ news.talk.venue }}]({{news.talk.url}}){% else %}{{ news.talk.venue }}{% endif %}
{%- elsif news.type %}{{ "unknown news type: " | append: news.type | error }}
{%- else %} {{ news.content | lang:include.lang }}
{%- endif %}
{% endfor %}
