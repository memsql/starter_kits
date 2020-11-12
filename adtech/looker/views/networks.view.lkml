view: networks {
  sql_table_name: adtech.networks ;;
  drill_fields: [network_id]

  dimension: network_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.network_id ;;
  }

  dimension: network_name {
    type: string
    sql: ${TABLE}.network_name ;;
  }

  measure: count {
    type: count
    drill_fields: [network_id, network_name]
  }
}
