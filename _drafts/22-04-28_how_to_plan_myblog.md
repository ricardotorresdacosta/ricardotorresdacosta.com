# Goal
Have simple and effective blog.

## Jekyll blog

1. update Jekyll installation locally
   - Follow [Jekyll's Ubuntu's guide](https://jekyllrb.com/docs/installation/ubuntu/)
   - check current version of each tool

2. Create basic Jekyll project
   - One way of doing it is by using `jekyll new`. Before running that command create a folder to store the source code for the website. Let's call this the root folder. There, run `jekyll new NAME_OF_MY_BLOG`
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

   Posts go into the folder `NAME_OF_MY_BLOG/_posts/`. 
   
   Draft posts in turn go in the folder `NAME_OF_MY_BLOG/_drafts/`. To visualise these posts in development, I can run the flag `--draft` on the `jekyll serve` command



    I'M HERE

    TODO
4. DNS between cool domain and ricardoptcosta.github.io

    <!---
    add Jekyll Gem to the Gemfile
    ```
    gem "jekyll"
    ```
    To create a website start with a index.html page

    ```
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>Home</title>
      </head>
      <body>
        <h1>Hello World!</h1>
      </body>
    </html>
    ```

    To build the website and display it on the browser locally run

    ```
    bundle exec jekyll serve -livereload -port 4000 -draft
    ```

    The [step by step tutorial](https://jekyllrb.com/docs/step-by-step/01-setup/) is very useful on learning the features of Jekyll.

    
    

    1. learn how to deploy jekyll locally 
      -
    5. Learn how to deploy via  github pages
      - 
    6. gain more control over CI/CD by learing how to deploy Jekyll with [CI/CD tool](https://jekyllrb.com/docs/deployment/), probably [GitHub Actions](https://jekyllrb.com/docs/continuous-integration/github-actions/) 
    5. Make list of useful blogs
   --!>    

