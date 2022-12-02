# Citrus

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://p-gw.github.io/Citrus.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://p-gw.github.io/Citrus.jl/dev)
[![Build Status](https://github.com/p-gw/Citrus.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/p-gw/Citrus.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/p-gw/Citrus.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/p-gw/Citrus.jl)

Citrus provides utilities to work with LimeSurvey from Julia.
It wraps two lower level packages:

- [CitrusAPI.jl](https://github.com/p-gw/CitrusAPI.jl)
- [CitrusBuilder.jl](https://github.com/p-gw/CitrusBuilder.jl)

This allows usage of the Remote Control 2 API via CitrusAPI.jl as well as survey building via CitrusBuilder.jl.

## Installation
```julia
pkg> add Citrus
```

## Getting started
Consider a basic survey asking for the name and gender of the survey participants. We can use Citrus to construct this survey and directly upload it to a running LimeSurvey server.

First, make a connection to the server.

```julia
client = CitrusClient("https://your-limesurvey-server.com/index.php/admin/remotecontrol")
connect!(client, "username", "password")
```

Second, construct the survey

```julia
gender_options = response_scale([
    response_option("f", "female"),
    response_option("m", "male")
])

basic_survey = survey(123456, "A basic survey") do
    question_group(1, "Basic participant information") do
        short_text_question("name", "Please state your full name.", mandatory=true),
        dropdown_list_question("gender", "Please select a gender.", gender_options, other=true, mandatory=true)
    end
end
```

And third, upload the survey

```julia
import_survey!(client, basic_survey)
```
