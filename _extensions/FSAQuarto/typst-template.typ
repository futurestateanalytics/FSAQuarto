
#let FSAQuarto(
  // The document title.
  title: "FSAQuarto",

  // Logo in top right corner.
  typst-logo: logo.png,

  // The document content.
  body
) = {

  // Set document metadata.
  set document(title: title)

  // Configure pages.
  set page(
    margin: (left: 2cm, right: 1.5cm, top: 2cm, bottom: 2cm),
    numbering: "1",
    number-align: right,
    background: place(right + top, rect(
      fill: rgb("#E6E6FA"),
      height: 100%,
      width: 3cm,
    ))
  )

  // Set the body font.
  set text(10pt, font: "IBMPlexMono")

  // Configure headings.
  show heading.where(level: 1): set block(below: 0.8em)
  show heading.where(level: 1): underline
  show heading.where(level: 2): set block(above: 0.5cm, below: 0.5cm)

  // Links should be purple.
  show link: set text(rgb("#44A6FF"))

  // Configure light purple border.
  show figure: it => block({
    move(dx: -3%, dy: 1.5%, rect(
      fill: rgb("44A6FF"),
      inset: 0pt,
      move(dx: 3%, dy: -1.5%, it.body)
    ))
  })

  // Purple border column
  grid(
    columns: (1fr, 0.75cm),
    column-gutter: 2.5cm,

    // Title.
    text(font: "IBMPlexMono", 20pt, weight: 800, upper(title)),

    // The logo in the sidebar.
    locate(loc => {
      set align(right)

      // Logo.
      style(styles => {
        if typst-logo == none {
          return
        }

        let img = image(typst-logo.path, width: 1.5cm)
        let img-size = measure(img, styles)

        grid(
          columns: (img-size.width, 1cm),
          column-gutter: 16pt,
          rows: img-size.height,
          img,
        )
      })

    }),

    // The main body text.
    {
      set par(justify: true)
      body
      v(1fr)
    },


  )
}


