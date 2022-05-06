---
title: "How I Setup my Blog"
categories:
  - Blogging
---
# Goal
Have a simple and effective blog.

# Jekyll blog

## Quickstart on exhisting project
### Locally
1. Go into root folder (currently /media/ric/root/repos/blog) and run `bundle exec jekyll server --livereload -P 4000`

## Installation process

1. update Jekyll installation locally
   - Follow [Jekyll's Ubuntu's guide](https://jekyllrb.com/docs/installation/ubuntu/)
   - check current version of each tool

2. Create basic Jekyll project
   - One way of doing it is by using `jekyll new`. Before running that command create a folder (I named it `blog`)to store the source code for the website. Let's call this the root folder. There, run `jekyll new NAME_OF_MY_BLOG`
   - Another way is to simply fork a theme. The default theme is called **minima**. I want a nicer theme. Some search of Jekyll themes in [GitHub](https://github.com/topics/jekyll-theme)

      The things I would like to have are:
      - Three columns
      - Middle column 
         - has a list of posts. 
         - Need to decide whether only to have short title, photo and brief description or entire scroll-down posts
      - Right column
         - Most popular posts
         - Recent Posts
         - Twitter
      - Other?

      **Minimal Mistakes** is a very popular theme and seems very flexible. Let's install that one. I used this [theme starter](https://github.com/mmistakes/mm-github-pages-starter)

      Fetch all the dependencies by running `bundle install` and then check how it looks like with
      `jekyll serve -livereload` \
      or \
      `bundle exec jekyll serve -livereload`

3. Format and add content to Jekyll project

    - Posts go into the folder `NAME_OF_MY_BLOG/_posts/`. 
   
    - Draft posts in turn go in the folder `NAME_OF_MY_BLOG/_drafts/`. To visualise these posts in development, I can run the flag `--draft` on the `jekyll serve` command
  
    - Edit the _config.yml to change the sample content with your own.

    - favicon
      - went to https://realfavicongenerator.net/, uploaded a .png image and then extracted the package into the folder `/assets/images/`.
      - added the produced `html` to `_includes/head/custom.html`

4. Make it available online
   1. Github pages ...
   2. Namecheap ...
   3. DNS between cool domain and github repo
   4. Create email server
      1. Google Workspace
      2. Zoho
    

   
    

    
# TODO:
  
   - investigate the layouts page and pick the best one and figure out how to configure it https://mmistakes.github.io/minimal-mistakes/docs/layouts/
   - see how to display blog posts as a grid
   - see how add header image to blog post
   - this _config seems very complete https://github.com/mmistakes/minimal-mistakes/blob/master/_config.yml
   - gain more control over CI/CD by learing how to deploy Jekyll with [CI/CD tool](https://jekyllrb.com/docs/deployment/), probably [GitHub Actions](https://jekyllrb.com/docs/continuous-integration/github-actions/) 