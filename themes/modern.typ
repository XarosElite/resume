// Modern — IBM Plex Sans + Plex Mono, indigo accent, block-marker section
// headings. A polished product-company look with a subtle engineering feel.
// Drop-in API compatible with @preview/basic-resume.

#let accent-state = state("modern-accent", rgb("#4f46e5"))
#let ink = rgb("#1f2937")
#let muted = rgb("#6b7280")
#let mono = ("IBM Plex Mono", "JetBrains Mono", "DejaVu Sans Mono")

#let _href(url) = if url.starts-with("http") { url } else { "https://" + url }
#let _meta(body) = text(font: mono, size: 0.86em, fill: muted, body)

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
  accent-color: "#4f46e5",
  font: ("IBM Plex Sans", "Inter", "Nimbus Sans", "DejaVu Sans"),
  paper: "us-letter",
  author-font-size: 28pt,
  font-size: 10pt,
  body,
) = {
  let accent = rgb(accent-color)
  accent-state.update(accent)

  set document(author: author, title: author)
  set text(font: font, size: font-size, fill: ink, lang: "en", ligatures: false)
  set page(margin: (x: 0.55in, y: 0.5in), paper: paper)
  set par(justify: false, leading: 0.55em, spacing: 0.6em)
  show link: set text(fill: accent)
  set list(
    marker: box(width: 4pt, height: 4pt, baseline: -0.12em, fill: accent, radius: 1pt),
    indent: 2pt,
    body-indent: 7pt,
    spacing: 0.55em,
  )

  show heading.where(level: 2): it => block(above: 1.3em, below: 0.75em, sticky: true, grid(
    columns: (auto, auto, 1fr),
    column-gutter: 7pt,
    align: horizon,
    box(width: 8pt, height: 8pt, fill: accent, radius: 1.5pt),
    text(size: 1.12em, weight: 700, it.body),
    line(length: 100%, stroke: 0.6pt + luma(215)),
  ))

  // Header
  align(author-position, text(size: author-font-size, weight: 700, tracking: -0.01em, author))
  v(-0.35em)
  align(author-position, box(width: 36pt, height: 3pt, fill: accent, radius: 1.5pt))
  v(0.1em)
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
  align(personal-info-position, text(font: mono, size: 0.88em, fill: muted, items.join(text(fill: luma(195))[#h(0.55em)·#h(0.55em)])))

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
  text(weight: 600, institution),
  _meta(if consistent { dates } else { location }),
  [#degree#if gpa != "" [ · GPA #gpa]],
  _meta(if consistent { location } else { dates }),
)

#let work(title: "", dates: "", company: "", location: "") = _entry(
  [#text(weight: 600, title) #context text(fill: accent-state.get(), weight: 500)[· #company]],
  _meta[#location#text(fill: luma(195))[#h(0.5em)|#h(0.5em)]#dates],
  none,
  none,
)

#let project(role: "", name: "", url: "", dates: "") = _entry(
  [#text(weight: 600, name)#if role != "" [ #text(fill: muted)[· #role]]],
  if dates != "" { _meta(dates) } else if url != "" { text(font: mono, size: 0.86em, link(_href(url), url)) },
  if url != "" and dates != "" { text(font: mono, size: 0.86em, link(_href(url), url)) },
  none,
)

#let certificates(name: "", issuer: "", url: "", date: "") = _entry(
  [#text(weight: 600, name)#text(fill: muted)[ · #issuer]],
  _meta(date),
  if url != "" { text(font: mono, size: 0.86em, link(_href(url), url)) },
  none,
)

#let extracurriculars(activity: "", dates: "") = _entry(text(weight: 600, activity), _meta(dates), none, none)
