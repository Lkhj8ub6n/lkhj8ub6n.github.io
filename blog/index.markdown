---
layout: std
title: blog
---

<div>
  <h2>Latest 10 recent blog (<a href="/blog/archive.html">see index</a>)</h2>
  <hr>
  {% for post in site.posts limit:10 %}
    <div {% if post.lang == "ar" %}dir="rtl" style="text-align: right;"{% endif %}>
      <h4>{{ post.date | date: "%B %d, %Y" }}</h4>
      <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
      {{ post.content }}
    </div>
    <hr>
  {% endfor %}
</div>
