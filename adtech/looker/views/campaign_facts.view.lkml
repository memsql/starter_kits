view: campaign_facts {
  derived_table: {
    sql: SELECT
          campaign,
          campaign_name,
          impression_count,
          click_count,
          downstream_conversion_count,
          click_count / impression_count AS conv_1,
          downstream_conversion_count / click_count AS conv_2,
          downstream_conversion_count / impression_count AS all_conv
      FROM (
          SELECT campaign,
          SUM(CASE WHEN (event_name="Impression") THEN 1 ELSE null END) AS impression_count,
          SUM(CASE WHEN (event_name="Click") THEN 1 ELSE null END) AS click_count,
          SUM(CASE WHEN (event_name="Downstream Conversion") THEN 1 ELSE null END) AS downstream_conversion_count
          FROM adtech.events
          WHERE advertiser = "Starbucks"
          group by campaign
      ) tab
      LEFT JOIN adtech.campaigns ON campaigns.campaign_id = campaign
      ORDER BY all_conv desc;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: campaign {
    type: number
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: impression_count {
    type: number
    sql: ${TABLE}.impression_count ;;
  }

  dimension: click_count {
    type: number
    sql: ${TABLE}.click_count ;;
  }

  dimension: downstream_conversion_count {
    type: number
    sql: ${TABLE}.downstream_conversion_count ;;
  }

  dimension: conv_1 {
    type: number
    sql: ${TABLE}.conv_1 ;;
  }

  dimension: conv_2 {
    type: number
    sql: ${TABLE}.conv_2 ;;
  }

  dimension: all_conv {
    type: number
    sql: ${TABLE}.all_conv ;;
  }

  set: detail {
    fields: [
      campaign,
      campaign_name,
      impression_count,
      click_count,
      downstream_conversion_count,
      conv_1,
      conv_2,
      all_conv
    ]
  }
}
