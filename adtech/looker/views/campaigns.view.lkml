view: campaigns {
  sql_table_name: adtech.campaigns ;;
  drill_fields: [campaign_id]

  dimension: campaign_id {
    primary_key: yes
    hidden:  yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    view_label: "Events"
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  
  dimension: end_date {
    type:  date
    sql:  ${TABLE}.end_date ;;
  }
  
  dimension: is_active_now {
    type: yesno
    sql:  ${TABLE}.is_active_now ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign_id, campaign_name]
  }
}
