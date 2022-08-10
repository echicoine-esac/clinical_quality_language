library TodayIssue

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.001'

context Patient

define "Most recent physical home address":
  First(
    Patient.address A
      where A.use = 'home'
        and A.type = 'physical'
      sort by Coalesce(end of period, Today()) desc
  )