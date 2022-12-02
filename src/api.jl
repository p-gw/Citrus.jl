"""
    import_survey!(client, survey::Survey; kwargs...)

Import a survey to a remote LimeSurvey server directly without saving it to a file.
"""
function CitrusAPI.import_survey!(client::CitrusClient, survey::Survey; kwargs...)
    survey_str = string(xml(survey))
    survey_enc = base64encode(survey_str)
    import_survey!(client, survey_enc, "lss"; kwargs...)
end
