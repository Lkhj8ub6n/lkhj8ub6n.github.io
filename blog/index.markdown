---
layout: std
title: Enter the void - blog

---

<div>
 <h2>Latest 10 recent blog
 (<a href="/blog
/archive.html">see index</a>)</h2>
 <hr>
 {% for post in site.posts limit:10 %}
 <h4>{{ post.date | date: "%B %d, %Y" }}</h4>
 <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
 {{ post.content }}
 <hr>
 {% endfor %}
</div>
