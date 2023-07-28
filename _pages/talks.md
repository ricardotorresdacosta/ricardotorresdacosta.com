---
title: "Talks"
layout: category
permalink: /talks/
author_profile: true
taxonomy: Talks
classes: wide
---

<style>
.video-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}
.video-container {
    flex: 0 0 45%; /* percentage for the column width */
    /* margin-bottom: 20px; */
}
.video-container h2 {
    font-size: 1em; /* adjust this to change the size of the title */
}
iframe {
    max-width: 100%;
}
</style>

<div class="video-grid">
    {% for video in site.data.youtube_videos %}
        <div class="video-container">
				    <h2>{{ video.title }}</h2>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/{{ video.id }}" frameborder="0" allowfullscreen></iframe>
        </div>
    {% endfor %}
</div>