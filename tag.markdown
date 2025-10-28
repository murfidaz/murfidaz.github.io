---
layout: page
title: Tags
permalink: /tag/
---

<h1>All Tags</h1>

<ul>
  {% assign sorted_tags = site.tags | sort %}
  {% for tag in sorted_tags %}
    <li>
      <a href="/tag/{{ tag[0] | slugify }}/">
        #{{ tag[0] }} ({{ tag[1].size }})
      </a>
    </li>
  {% endfor %}
</ul>
