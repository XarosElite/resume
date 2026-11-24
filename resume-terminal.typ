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
  degree: "Bachelor's of Computer Science",
  consistent: true
)

== Work Experience

#work(
  title: "Full Stack Web Developer / Cloud Engineer",
  location: "Dayton, OH",
  company: "Awetomaton",
  dates: dates-helper(start-date: "November 2025", end-date: "Present"),
)
- Worked on Full Stack Web project where I added features to a React front end, Golang api Backend, and postgres sql Database to better provide the customer insite into their data.
- Created and fixed kubernetes deployments for a variety of applications
- Managed application deployments using ArgoCD and Kustomize
- Wrote and Implemented CI/CD pipelines using bash

#work(
  title: "Software Engineer I",
  location: "Dayton, OH",
  company: "Altamira",
  dates: dates-helper(start-date: "May 2024", end-date: "November 2025"),
)
- Integrates computer vision R&D projects into scalable pipelines for various customers.
- Helped lead an Internal Project to create a full stack web application that integrates a Computer Vision model to help a customer process their data. Stack included React TS, Flask, Golang, Docker, Docker Compose.

#work(
  title: "Software Engineer Intern",
  location: "Dayton, OH",
  company: "Altamira",
  dates: [
    #dates-helper(start-date: "May 2022", end-date: "August 2022"),
    #dates-helper(start-date: "May 2023", end-date: "August 2023"),
  ],)
- Wrote basic python scripts to format data for machine learning models.
- Trained a Word2Vec machine learning model and integrated it into a web application to plot it.
- Worked with a large Plotly Dash Web application to visualize data for a customer.
- Trained a Pix2Pix Computer Vision model to detect lines in a noisy scene.

#work(
  title: "Cats Help Desk",
  location: "Dayton, OH",
  company: "Wright State University",
  dates: dates-helper(start-date: "January 2020", end-date: "November 2021"),
)
- Solved general help desk tickets.
- Troubleshooted problems with laptops, accounts, passwords, etc.
- Learned a great deal of problem solving skills at this job by helping students with their technical problems.

#work(
  title: "IT Intern",
  location: "Marion, OH",
  company: "Tri-Rivers Career Center",
  dates: dates-helper(start-date: "May 2019", end-date: "December 2019"),
)
- Helped maintain the school's network connectivity, troubleshoot internet / network issues, update and maintain student laptops, make ethernet cable runs from networking closets to devices.

== Projects

#project(
  role: "Maintainer",
  name: "Playhub",
  url: "github.com/XarosElite/playhub"
)
- A Docker based full stack game server manager
- See a (#link("https://www.jacobpoling.com/projects/playhub/")[Demo]) and explenation on my site!

#project(
  role: "Contributor",
  name: "Self Hosted Proxmox and Kubernetes Infarastructure Homelab",
)
- Built a 5 node Proxmox Cluster and deployed VM's across the nodes with Kubernetes Control Planes and Workers
- Implemented GitOps Workflow by deploying ArgoCD and using Kustomize to automatically deploy applications in a github orginization.
== Extracurricular Activities

#extracurriculars(
  activity: "Cross County/Track NCAA Division I Athlete",
  dates: dates-helper(start-date: "Aug 2019", end-date: "May 2024"),
)
- Competed collegially for Wright State University's Cross Country and Track team.

== Certifications

#certificates(
  name: "CompTIA IT Fundamentals+ (ID: W7NYSGLMTDQQ13WE)",
  issuer: "CompTIA",
  url: "http://verify.CompTIA.org",
  date: "May 2019",
)

== Skills
- *Programming Languages*: Python, C/C++, Java, JavaScript/Typescript, Godot, HTML/CSS
- *Technologies*: Vim, UNIX, React, Flask, FastApi, Git, Docker, Docker Compose, Nix, Proxmox
