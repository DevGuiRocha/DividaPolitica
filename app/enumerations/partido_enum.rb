class PartidoEnum < EnumerateIt::Base
    associate_values(
      pt:   "PT",
      psdb: "PSDB",
      mdb:  "MDB",
      pdt:  "PDT",
      pl:   "PL",
      dem:  "DEM",
      pp:   "PP"
    )
  end