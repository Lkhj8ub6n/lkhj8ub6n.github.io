---
layout: std
title: blog
 archive
---

<div class="page-header">
 <h2>blog
 - Archive index</h2>
</div>

{% for post in site.posts reverse %}
{% if post.index != false %}
* {{ post.date | date: "%d.%m.%Y" }} - [{{ post.title }}]({{ post.url }})
{% endif %}
{% endfor %}
