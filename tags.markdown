---
layout: page
title: Tags
permalink: /tags/
---

<h1>🏷️ All Tags</h1>

<ul>
  {% assign sorted_tags = site.tags | sort %}
  {% for tag in sorted_tags %}
    {% assign tag_name = tag[0] %}
    {% assign posts = tag[1] %}
    <li>
      <a href="{{ tag_name | tag_url }}">
        #{{ tag_name }}
      </a>
      <span>({{ posts | size }})</span>
    </li>
  {% endfor %}
</ul>
