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
- Added features to a full stack web application with a React frontend, Golang API backend, and PostgreSQL database to give the customer better insight into their data.
- Created and fixed Kubernetes deployments for a variety of applications.
- Managed application deployments using ArgoCD and Kustomize.
- Wrote and implemented CI/CD pipelines using Bash.

#work(
  title: "Software Engineer I",
  location: "Dayton, OH",
  company: "Altamira",
  dates: dates-helper(start-date: "May 2024", end-date: "November 2025"),
)
- Integrated computer vision R&D projects into scalable pipelines for various customers.
- Helped lead an internal project to build a full stack web application that integrates a computer vision model to help a customer process their data. Stack included React TS, Flask, Golang, Docker, and Docker Compose.

#work(
  title: "Software Engineer Intern",
  location: "Dayton, OH",
  company: "Altamira",
  dates: [#dates-helper(start-date: "May 2022", end-date: "August 2022"), #dates-helper(start-date: "May 2023", end-date: "August 2023")],
)
- Wrote Python scripts to format data for machine learning models.
- Trained a Word2Vec machine learning model and integrated it into a web application to plot it.
- Worked on a large Plotly Dash web application to visualize data for a customer.
- Trained a Pix2Pix computer vision model to detect lines in noisy scenes.

#work(
  title: "Cats Help Desk",
  location: "Dayton, OH",
  company: "Wright State University",
  dates: dates-helper(start-date: "January 2020", end-date: "November 2021"),
)
- Resolved general help desk tickets.
- Troubleshot problems with laptops, accounts, passwords, etc.
- Built strong problem solving skills by helping students with their technical problems.

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
- A Docker-based full stack game server manager.
- See a #link("https://www.jacobpoling.com/projects/playhub/")[demo] and explanation on my site.

#project(
  role: "Contributor",
  name: "Self-Hosted Proxmox and Kubernetes Infrastructure Homelab",
)
- Built a 5-node Proxmox cluster with VMs running Kubernetes control planes and workers.
- Implemented a GitOps workflow by deploying ArgoCD and using Kustomize to automatically deploy applications from a GitHub organization.

== Extracurricular Activities

#extracurriculars(
  activity: "Cross Country/Track NCAA Division I Athlete",
  dates: dates-helper(start-date: "Aug 2019", end-date: "May 2024"),
)
- Competed for Wright State University's Cross Country and Track team.

== Certifications

#certificates(
  name: "CompTIA IT Fundamentals+ (ID: W7NYSGLMTDQQ13WE)",
  issuer: "CompTIA",
  url: "http://verify.CompTIA.org",
  date: "May 2019",
)

== Skills
- *Programming Languages*: Python, Go, C/C++, Java, JavaScript/TypeScript, Bash, Godot, HTML/CSS
- *Technologies*: Vim, UNIX, React, Flask, FastAPI, PostgreSQL, Git, Docker, Docker Compose, Kubernetes, ArgoCD, Kustomize, Nix, Proxmox
