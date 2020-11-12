connection: "reference_solutions"

# include all the views
include: "/views/**/*.view"
include: "/dashboards/**/*.dashboard"

datagroup: ref_sol_adtech_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ref_sol_adtech_default_datagroup

explore: campaigns {}

explore: events {
  join: campaigns {
    type: left_outer
    relationship: many_to_one
    sql_on: ${events.campaign} = ${campaigns.campaign_id} ;;
  }
}

explore: campaign_facts {}

explore: networks {}

explore: platforms {}
