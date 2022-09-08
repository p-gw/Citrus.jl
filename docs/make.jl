using Citrus
using Documenter

DocMeta.setdocmeta!(Citrus, :DocTestSetup, :(using Citrus); recursive=true)

makedocs(;
    modules=[Citrus],
    authors="Philipp Gewessler",
    repo="https://github.com/p-gw/Citrus.jl/blob/{commit}{path}#{line}",
    sitename="Citrus.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://p-gw.github.io/Citrus.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/p-gw/Citrus.jl",
    devbranch="main",
)
