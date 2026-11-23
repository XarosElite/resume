// Banner — bold full-bleed dark header band with the name and contact info,
// sky-blue accents and underlined section headings. Most visually striking
// of the set while staying single-column and ATS-safe.
// Drop-in API compatible with @preview/basic-resume.

#let accent-state = state("banner-accent", rgb("#0284c7"))
#let navy = rgb("#0f172a")
#let ink = rgb("#1e293b")
#let muted = rgb("#64748b")

#let _href(url) = if url.starts-with("http") { url } else { "https://" + url }

#let resume(
  author: "",
  author-position: center,
  personal-info-position: center,
  pronouns: "",
  location: "",
  email: "",
  github: "",
  linkedin: "",
  phone: "",
  personal-site: "",
  orcid: "",
  accent-color: "#0284c7",
  header-color: "#0f172a",
  font: ("Inter", "IBM Plex Sans", "Nimbus Sans", "DejaVu Sans"),
  paper: "us-letter",
  author-font-size: 28pt,
  font-size: 10pt,
  body,
) = {
  let accent = rgb(accent-color)
  let margin = 0.5in
  accent-state.update(accent)

  set document(author: author, title: author)
  set text(font: font, size: font-size, fill: ink, lang: "en", ligatures: false)
  set page(margin: margin, paper: paper)
  set par(justify: false, leading: 0.55em, spacing: 0.6em)
  show strong: set text(weight: 600)
  show link: set text(fill: accent)
  set list(
    marker: text(fill: accent, sym.bullet),
    indent: 2pt,
    body-indent: 6pt,
    spacing: 0.55em,
  )

  show heading.where(level: 2): it => block(above: 1.3em, below: 0.75em, sticky: true, stack(
    spacing: 4pt,
    text(size: 1.05em, weight: 700, fill: navy, tracking: 0.06em, upper(it.body)),
    grid(
      columns: (28pt, 1fr),
      align: bottom,
      line(length: 100%, stroke: 2.2pt + accent),
      line(length: 100%, stroke: 0.6pt + luma(220)),
    ),
  ))

  // Full-bleed header band (negative padding cancels the page margin)
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
  pad(x: -margin, top: -margin, block(
    width: 100%,
    fill: rgb(header-color),
    inset: (x: margin, top: 0.42in, bottom: 0.32in),
    {
      show link: set text(fill: rgb("#7dd3fc"))
      align(author-position, text(size: author-font-size, weight: 700, fill: white, tracking: -0.01em, author))
      v(-0.2em)
      align(personal-info-position, text(fill: rgb("#cbd5e1"), items.join(text(fill: rgb("#475569"))[#h(0.6em)•#h(0.6em)])))
    },
  ))

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
