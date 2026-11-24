#import "themes/terminal.typ": *

#let name = "Jacob Poling"
#let location = "Dayton, OH"
#let email = "polingj999@gmail.com"
#let github = "github.com/XarosElite"
#let personal-site = "jacobpoling.com"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  personal-site: personal-site,
  accent-color: "#15803d",
  font-size: 9.8pt,
  paper: "us-letter",
)
#align(left, "Active Security Clearance")

== Education

#edu(
  institution: "Wright State University",
  location: "Dayton, OH",
  dates: dates-helper(start-date: "Aug 2019", end-date: "May 2024"),
  degree: "Bachelor's in Computer Science",
  consistent: true
)

== Work Experience

#work(
  title: "Full Stack Web Developer / Cloud Engineer",
  location: "Dayton, OH",
  company: "Awetomaton",
  dates: dates-helper(start-date: "November 2025", end-date: "Present"),
)
- Develop features end to end across a full stack web application with a React frontend, Golang API backend, and PostgreSQL database, giving the customer better insight into their data.
- Create and troubleshoot Kubernetes deployments for a variety of applications.
- Manage application deployments through a GitOps workflow using ArgoCD and Kustomize.
- Write and maintain CI/CD pipelines in Bash to automate building and deploying applications.

#work(
  title: "Software Engineer I",
  location: "Dayton, OH",
  company: "Altamira",
  dates: dates-helper(start-date: "May 2024", end-date: "November 2025"),
)
- Turned computer vision R&D prototypes into scalable data processing pipelines for multiple customers.
- Helped lead an internal full stack web app that lets a customer process data with a computer vision model.
- Built with React TypeScript, Flask, and Golang services, containerized with Docker and Docker Compose.

#work(
  title: "Software Engineer Intern",
  location: "Dayton, OH",
  company: "Altamira",
  dates: [#dates-helper(start-date: "May 2022", end-date: "August 2022"), #dates-helper(start-date: "May 2023", end-date: "August 2023")],
)
- Wrote Python scripts to transform and format datasets for training machine learning models.
- Trained a Word2Vec model and integrated it into a web application to visualize its word embeddings.
- Developed features in a large Plotly Dash web application used to visualize data for a customer.
- Trained a Pix2Pix (conditional GAN) computer vision model to detect lines in noisy scenes.

#work(
  title: "Cats Help Desk",
  location: "Dayton, OH",
  company: "Wright State University",
  dates: dates-helper(start-date: "January 2020", end-date: "November 2021"),
)
- Resolved help desk tickets covering laptop hardware, software, account, and password issues.
- Built troubleshooting and communication skills by walking students through technical fixes.

#work(
  title: "IT Intern",
  location: "Marion, OH",
  company: "Tri-Rivers Career Center",
  dates: dates-helper(start-date: "May 2019", end-date: "December 2019"),
)
- Helped maintain the school's network connectivity, troubleshot internet and network issues, updated and maintained student laptops, and ran Ethernet cable from networking closets to devices.

== Projects

#project(
  role: "Maintainer",
  name: "Playhub",
  url: "github.com/XarosElite/playhub"
)
- Web app to deploy, monitor, and manage Video game servers inside docker containers. See a #link("https://www.jacobpoling.com/projects/playhub/")[demo] on my site.
- Built using a microservice architecture: React TypeScript frontend, FastAPI backend, Redis Queue worker for async container jobs, PostgreSQL, and a Docker socket proxy to restrict daemon access.
- Added an in-browser interactive terminal for running game servers over WebSockets, live CPU/RAM monitoring, and automatic port assignment, backed by a pytest test suite.

#project(
  name: "Self-Hosted Proxmox and Kubernetes Infrastructure Homelab",
)
- Built and operate a 5-node Proxmox cluster with VMs running Kubernetes control plane and worker nodes.
- Set up a GitOps workflow with ArgoCD and Kustomize to auto-deploy apps from a GitHub organization.
- Host personal projects including Playhub; ran Jenkins to build and package Playhub as a Debian installer.
- Manage development environments declaratively with NixOS and Nix flakes for reproducible builds.

== Certifications

#certificates(
  name: "CompTIA IT Fundamentals+ (ID: W7NYSGLMTDQQ13WE)",
  issuer: "CompTIA",
  url: "http://verify.CompTIA.org",
  date: "May 2019",
)

== Skills
- *Programming Languages*: Python, Go, C/C++, Java, JavaScript/TypeScript, Bash, Godot, HTML/CSS
- *Technologies*: Vim, UNIX, React, Flask, FastAPI, PostgreSQL, Git, Docker, Docker Compose, Redis, Kubernetes, ArgoCD, Kustomize, Jenkins, Nix, Proxmox
