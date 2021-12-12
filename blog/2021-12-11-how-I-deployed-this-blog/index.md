---
slug: how-I-deployed-this-blog
title: How I deployed this blog.
authors: [doughepi]
tags: [gcp, devops, terraform, github, cicd]
---

Deploying my Docusaurus portfolio and blog with Terraform and Github Workflows.

<!--truncate-->

## Background

I've always been annoyed by life stories inserted at the beginning of technical articles for the purposes of search engine optimization, so I'll try and keep this part short.

I've been meaning to spin up a combination portfolio and blog for a while now. Part of the reason I haven't is probably time. I've been quite busy traveling for the holidays, working on personal projects, and so on. Typical life stuff. 

The biggest reason I haven't deployed a portfolio and blog is simply that I haven't really prioritized my own brand until recently. I guess I didn't feel like I had anything new to contribute to the world of software. However, I've recently come to the conclusion that you don't always have to contribute new things. Often times, people are just looking for a way to combine existing things together. This is where I believe I have something interesting to share.

I have spent the last two months developing what I consider a scalable, repeatable, and secure framework for managing infrastructure using Packer, Terraform, Ansible, and GitHub Workflows. It is not *really* for personal use, although it could be. What my framework really is—in my opinion—is a solution to the scaling problem that enterprises face when undergoing a cloud migration. It tackles concepts in security, seperation of concerns, developer self-service, and more.

I'm not totally ready to show my framework to the world, yet! That being said, I can accomplish two things with this blog.

1. This blog **will** be the location of my future blog posts of my framework.
2. This blog serves as an example of one particular use case of my framework: continuous deployment of Jamstack sites using Terraform and GitHub Workflows.

I guess I didn't keep this section short. Let's get started!

## What I Built

Before I get into the details of how this blog is deployed, let me just lay out the entire stack for those who may be looking to do something similar.

This blog is a [Docusaurus](https://docusaurus.io/) site deployed to a [Google Cloud Storage](https://cloud.google.com/storage) bucket on [Google Cloud Platform](https://cloud.google.com/). The Docusaurus instance lives in a GitHub repository, and is deployed via a GitHub Workflow that includes a Terraform step, a Yarn build step, and a Google Cloud Storage bucket file upload step.

### Why Docusaurus?

Before I deployed this blog, I explored a few different options. For example, I started with a no-code solution using [Notion](https://www.notion.so/product) [public pages](https://www.notion.so/help/public-pages-and-web-publishing). It was quick and easy, but it left much to be desired in terms of customizability and simple blog stuff like the ability to use my [https://piper.codes](https://piper.codes) domain name.

I also tried

* [Mkdocs](https://www.mkdocs.org/)
* [Confluence](https://www.atlassian.com/software/confluence)

I even tried just building my own [Next.js](https://nextjs.org/) application. This probably would have worked, if I had enough time to spend writing a portfolio and blog application from scratch.

I settled on Docusaurus because of two things.

1. It's a great looking Jamstack framework based on React that supports markdown-based documentation and blog entries.
2. It seems to have prioritized [search engine optimization](https://docusaurus.io/docs/seo) in a manner that none of the previous options have.

That's not to say there isn't a better option, but Docusaurus works for me.

:::info
Docusaurus has a great [comparison of alternative frameworks](https://docusaurus.io/docs#comparison-with-other-tools).
:::

### Why Google Cloud Platform?

Another question I'm anticipating is why I would use Google Cloud Platform, especially when there are many platform-as-a-service (PaaS) offerings, like Vercel or Heroku, that support continuous deployment. Sometimes, right out of a GitHub repository.

I suppose I'm biased in a way. I am a Cloud Engineer, and I generally prefer working directly with the cloud platform as opposed to using services of a PaaS (that may themselves be hosted on a cloud platform). I'll acknowledge that.

Part of the reason I went with Google Cloud Platform is because, as  I mentioned above, I'm working on a framework for Terraform scalability *on Google Cloud Platform*. I chose Google Cloud Platform for this blog because I can apply part of what I've already developed to its deployment process.

It's also due to cost. Docusaurus is a Jamstack application, which means it can be built into a series of static pages. Static pages fit naturally within Google's Cloud Storage and CDN products. At small scales, PaaS services like Vercel offer advantageous fully-free pricing models for non-commercial use. At higher volumes however, the scale usually tips in the favor of the do-it-yourself cloud platforms. Unless you can negotiate special pricing with those PaaS providers, of course.

I'm interested to see how much Google Cloud Platform costs in practice, as pricing is highly dependent on a whole bunch of hard to estimate metrics.

## How I Built It

I'll describe the overall process of deploying this blog here. You can follow it if you're interested in setting up your own.

### Buy Domain

I usually use [Google Domains](https://domains.google.com) for my domain name needs.

I knew that if I wanted my blog to be interesting and easily searcahble, I needed a nice domain name. I figured my name would be short and recognizable enough, so I looked for an interesting top level domain.

![Google Domains Search](img/google-domains-search.png)

I eventually settled on [https://piper.codes](https://piper.codes). I didn't realize `codes` was a valid top level domain, but I think it suits a blog and portfolio website quite well!

### Build Docusaurus



### Add Terraform

### Add GitHub Workflows

### Triggering Deployment