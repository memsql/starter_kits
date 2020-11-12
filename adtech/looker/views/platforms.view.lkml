view: platforms {
  sql_table_name: adtech.platforms ;;
  drill_fields: [platform_id]

  dimension: platform_id {
    primary_key: yes
    hidden:  yes
    type: number
    sql: ${TABLE}.platform_id ;;
  }

  dimension: network_name {
    type: string
    sql: ${TABLE}.network_name ;;
  }

  measure: count {
    type: count
    drill_fields: [platform_id, network_name]
  }
}
