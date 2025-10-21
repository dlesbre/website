{%- comment -%}
  List all talks
{%- endcomment -%}

{%- if page.lang == "fr" -%}
  {% capture slide_text %}{% include icon.html icon="powerpoint" %}&nbsp;Diapositives{% endcapture %}
  {% capture video_text %}{% include icon.html icon="video" %}&nbsp;Vidéo{% endcapture %}
{%- else -%}
  {% capture slide_text %}{% include icon.html icon="powerpoint" %}&nbsp;Slides{% endcapture %}
  {% capture video_text %}{% include icon.html icon="video" %}&nbsp;Video{% endcapture %}
{%- endif -%}

{%- assign talks = site.data.talks | sort: "date" | reverse -%}

{%- for talk in talks -%}
{%- assign extras = "" | split: "," -%}

{%- if talk.paper -%}
  {%- assign slides-path = '/files/publications/' | append: talk.paper.slug | append: '-slides.pdf' -%}
	{%- assign slides = site.static_files | find: "path", slides-path -%}
	{%- if slides -%}
		{%- capture slides -%}[{{ slide_text }}]({% include url.txt url=slides.path %}){%- endcapture -%}
		{%- assign extras = extras | push: slides -%}
	{%- endif -%}

	{%- if talk.paper.talk-video -%}
		{%- capture video -%}[{{ video_text }}{{ talk.paper.talk-video-length | to_string | opt_wrap: ' (', 'min)' }}]({% include url.txt url=talk.paper.talk-video %}){%- endcapture -%}
		{%- assign extras = extras | push: video -%}
	{%- endif -%}
{%- endif -%}

{%- if talk.slides -%}
	{%- capture slides -%}[{{ slide_text }}]({% include url.txt url=talk.slides %}){%- endcapture -%}
	{%- assign extras = extras | push: slides -%}
{%- endif -%}

{%- if talk.video -%}
	{%- capture video -%}[{{ video_text }}{{ talk.video-length | to_string | opt_wrap: ' (', 'min)' }}]({% include url.txt url=talk.video %}){%- endcapture -%}
	{%- assign extras = extras | push: video -%}
{%- endif %}
{{ talk.date }}
: {% if talk.paper %}[*{{ talk.paper.title }}*]({% include paper_url.txt slug=talk.paper.slug %}) &mdash; [{{ talk.paper.venue.acronym }} {{talk.paper.year }}]({{ talk.paper.venue.url }}){% else %}*{{ talk.title }}* &mdash; {{ talk.venue | lang:page.lang | opt_url: talk.url }}{% endif %}{{ extras | join: " &ndash; " | opt_prepend: "<br>" }}
{% endfor %}
