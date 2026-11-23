// Clean — minimal, sans-serif, lots of whitespace.
// The "big tech" look: Inter, one accent color, hairline section rules.
// Drop-in API compatible with @preview/basic-resume.

#let accent-state = state("clean-accent", rgb("#2563eb"))
#let ink = rgb("#111827")
#let muted = rgb("#6b7280")

#let _href(url) = if url.starts-with("http") { url } else { "https://" + url }

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
  accent-color: "#2563eb",
  font: ("Inter", "IBM Plex Sans", "Nimbus Sans", "DejaVu Sans"),
  paper: "us-letter",
  author-font-size: 26pt,
  font-size: 10pt,
  body,
) = {
  let accent = rgb(accent-color)
  accent-state.update(accent)

  set document(author: author, title: author)
  // Ligatures off so ATS parsers read the text cleanly.
  set text(font: font, size: font-size, fill: ink, lang: "en", ligatures: false)
  set page(margin: 0.5in, paper: paper)
  set par(justify: false, leading: 0.55em, spacing: 0.6em)
  show strong: set text(weight: 600)
  show link: set text(fill: accent)
  set list(
    marker: text(fill: accent, sym.bullet),
    indent: 2pt,
    body-indent: 6pt,
    spacing: 0.55em,
  )

  show heading.where(level: 2): it => block(above: 1.25em, below: 0.7em, sticky: true, stack(
    spacing: 4pt,
    text(size: 0.95em, weight: 700, fill: accent, tracking: 0.1em, upper(it.body)),
    line(length: 100%, stroke: 0.6pt + luma(210)),
  ))

  // Header
  align(author-position, text(size: author-font-size, weight: 700, tracking: -0.02em, author))
  v(-0.3em)
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
  align(personal-info-position, text(fill: muted, items.join(h(0.6em) + text(fill: luma(200), "|") + h(0.6em))))

  body
}

#let dates-helper(start-date: "", end-date: "") = start-date + " – " + end-date

#let _entry(tl, tr, bl, br) = block(above: 1em, below: 0.6em, sticky: true, grid(
  columns: (1fr, auto),
  row-gutter: 0.5em,
  column-gutter: 1em,
  tl, align(right, tr),
  ..if bl != none or br != none { (bl, align(right, br)) },
))

#let edu(institution: "", dates: "", degree: "", gpa: "", location: "", consistent: false) = _entry(
  strong(institution),
  text(fill: muted, if consistent { dates } else { location }),
  [#degree#if gpa != "" [ #text(fill: muted)[· GPA #gpa]]],
  text(fill: muted, if consistent { location } else { dates }),
)

#let work(title: "", dates: "", company: "", location: "") = _entry(
  strong(title),
  text(fill: muted, dates),
  context text(fill: accent-state.get(), weight: 500, company),
  text(fill: muted, location),
)

#let project(role: "", name: "", url: "", dates: "") = _entry(
  [#strong(name)#if role != "" [ #text(fill: muted)[· #role]]#if url != "" and dates != "" [ #h(0.4em)#link(_href(url), url)]],
  if dates != "" { text(fill: muted, dates) } else if url != "" { link(_href(url), url) },
  none,
  none,
)

#let certificates(name: "", issuer: "", url: "", date: "") = _entry(
  [#strong(name)#text(fill: muted)[ · #issuer]#if url != "" [ #h(0.4em)#link(_href(url), url)]],
  text(fill: muted, date),
  none,
  none,
)

#let extracurriculars(activity: "", dates: "") = _entry(strong(activity), text(fill: muted, dates), none, none)
