#let conf(
  authors: (),
  abstract: [],
  doc,
) = {

  place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 2em,
    {
      title()

      let count = authors.len()
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 24pt,
        ..authors.map(author => [
          #author.name 
        ]),
      )

      par(justify: false)[
        #abstract
      ]

    }
  )

  doc
}