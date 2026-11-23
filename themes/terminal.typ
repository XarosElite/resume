// Terminal — developer-flavored. JetBrains Mono for the name, headings and
// metadata; Inter for readable body text; green accent and markdown-style
// "##" section headings. Still single-column and ATS-safe.
// Drop-in API compatible with @preview/basic-resume.

#let accent-state = state("terminal-accent", rgb("#15803d"))
#let ink = rgb("#18181b")
#let muted = rgb("#71717a")
#let mono = ("JetBrains Mono", "IBM Plex Mono", "DejaVu Sans Mono")

#let _href(url) = if url.starts-with("http") { url } else { "https://" + url }
#let _meta(body) = text(font: mono, size: 0.85em, fill: muted, body)
#let _mono-link(url) = text(font: mono, size: 0.85em, link(_href(url), url))

#let resume(
  author: "",
  author-position: left,
  personal-info-position: left,
  pronouns: "",
  location: "",
  email: "",
  github: "",
  linkedin: "",
  phone: "",
  personal-site: "",
  orcid: "",
  accent-color: "#15803d",
  font: ("Inter", "IBM Plex Sans", "Nimbus Sans", "DejaVu Sans"),
  paper: "us-letter",
  author-font-size: 24pt,
  font-size: 9.8pt,
  body,
) = {
  let accent = rgb(accent-color)
  accent-state.update(accent)

  set document(author: author, title: author)
  set text(font: font, size: font-size, fill: ink, lang: "en", ligatures: false)
  set page(margin: 0.5in, paper: paper)
  set par(justify: false, leading: 0.55em, spacing: 0.6em)
  show link: set text(fill: accent)
  set list(
    marker: text(font: mono, fill: accent, weight: 700, ">"),
    indent: 2pt,
    body-indent: 6pt,
    spacing: 0.55em,
  )

  show heading.where(level: 2): it => block(above: 1.3em, below: 0.75em, sticky: true, grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    align: horizon,
    text(font: mono, size: 1.08em, weight: 700)[#text(fill: accent)[\#\#] #it.body],
    line(length: 100%, stroke: (paint: luma(200), thickness: 0.6pt, dash: "dotted")),
  ))

  // Header: name with a block "cursor"
  align(author-position, text(font: mono, size: author-font-size, weight: 800, tracking: -0.02em)[
    #author#h(3pt)#box(width: 0.5em, height: 0.8em, baseline: 0pt, fill: accent)
  ])
  v(-0.25em)
  let item(value, scheme: "") = if value != "" {
    if scheme != "" { link(scheme + value, value) } else { value }
  }
  let items = (
    item(pronouns),
    item(phone),
    item(location),
    item(email, scheme: "mailto:"),
    item(github, scheme: "https://"),
    item(linkedin, scheme: "https://"),
    item(personal-site, scheme: "https://"),
    item(orcid, scheme: "https://orcid.org/"),
  ).filter(x => x != none)
  align(personal-info-position, text(font: mono, size: 0.88em, fill: muted,
    items.join(text(fill: luma(190))[#h(0.5em)/#h(0.5em)])))

  body
}

#let dates-helper(start-date: "", end-date: "") = start-date + " – " + end-date

#let _entry(tl, tr, bl, br) = block(above: 1.05em, below: 0.6em, sticky: true, grid(
  columns: (1fr, auto),
  row-gutter: 0.5em,
  column-gutter: 1em,
  tl, align(right, tr),
  ..if bl != none or br != none { (bl, align(right, br)) },
))

#let edu(institution: "", dates: "", degree: "", gpa: "", location: "", consistent: false) = _entry(
  strong(institution),
  _meta(if consistent { dates } else { location }),
  [#degree#if gpa != "" [ · GPA #gpa]],
  _meta(if consistent { location } else { dates }),
)

#let work(title: "", dates: "", company: "", location: "") = _entry(
  [#strong(title) #context text(font: mono, size: 0.92em, weight: 600, fill: accent-state.get())[\@ #company]],
  _meta[#location#text(fill: luma(195))[#h(0.5em)|#h(0.5em)]#dates],
  none,
  none,
)

#let project(role: "", name: "", url: "", dates: "") = _entry(
  [#text(font: mono, weight: 700, name)#if role != "" [ #text(fill: muted)[· #role]]],
  if dates != "" { _meta(dates) } else if url != "" { _mono-link(url) },
  if url != "" and dates != "" { _mono-link(url) },
  none,
)

#let certificates(name: "", issuer: "", url: "", date: "") = _entry(
  [#strong(name)#text(fill: muted)[ · #issuer]],
  _meta(date),
  if url != "" { _mono-link(url) },
  none,
)

#let extracurriculars(activity: "", dates: "") = _entry(strong(activity), _meta(dates), none, none)
