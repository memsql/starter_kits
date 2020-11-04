view: events {
  sql_table_name: adtech.events ;;

  dimension: advertiser {
    type: string
    sql: ${TABLE}.advertiser ;;
    drill_fields: [campaign, country]
  }

  dimension: campaign {
    hidden: yes
    type: number
    sql: ${TABLE}.campaign ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: income {
    type: string
    sql: ${TABLE}.income ;;
  }

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: total_cost {
    type : number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: created_date {
    type:  date
    sql:  ${TABLE}.created_date ;;
  }

  measure: cost {
    type:  sum
    drill_fields: [advertiser, campaigns.campaign_name, count]
  }

  measure: count {
    type: count
    drill_fields: [advertiser, campaigns.campaign_name, count]
  }

  measure: total_impressions {
    type: count

    drill_fields: [campaigns.campaign_name, total_impressions]

    filters: {
      field: event_name
      value: "Impression"
    }
  }

  measure: total_clicks {
    type: count

    drill_fields: [campaign, total_clicks]

    filters: {
      field: event_name
      value: "Click"
    }
  }

  measure: click_through_rate {
    type: number
    sql: ${total_clicks} / nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: click_rate {
    type: number
    sql: ${total_clicks} / nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }
}
