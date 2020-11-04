- dashboard: ad_events_dashboard
  title: Ad Events Dashboard
  layout: newspaper
  load_configuration: wait
  description: Real-time Looker+MemSQL dashboard using MemSQL Pipelines
  refresh: 1 minute
  elements:
  - title: No of  Ad Events
    name: No of  Ad Events
    model: ref_sol_adtech
    explore: events
    type: single_value
    fields: [events.count]
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    refresh: 1 second
    listen: {}
    row: 0
    col: 14
    width: 9
    height: 2
  - title: Ad Events by Country
    name: Ad Events by Country
    model: ref_sol_adtech
    explore: events
    type: looker_column
    fields: [events.advertiser, events.country, events.count]
    pivots: [events.country]
    filters:
      events.count: ">200"
    sorts: [events.country desc, events.count desc 0]
    limit: 500
    column_limit: 50
    trellis: ''
    stacking: ''
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    refresh: 1 second
    listen: {}
    row: 8
    col: 0
    width: 14
    height: 10
  - title: No of Ad Events by Top 5 Advertiser
    name: No of Ad Events by Top 5 Advertiser
    model: ref_sol_adtech
    explore: events
    type: looker_pie
    fields: [events.advertiser, events.count]
    filters:
      events.advertiser: "%Subway%,%McDonals%,%Starbucks%,%Dollar General%,%YUM! Brands%,%Dunkin\
        \ Brands Group%"
    sorts: [events.count desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    series_colors: {}
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    refresh: 1 second
    listen: {}
    row: 2
    col: 14
    width: 9
    height: 6
  - title: Ad Event counts by Income
    name: Ad Event counts by Income
    model: ref_sol_adtech
    explore: events
    type: looker_column
    fields: [events.gender, events.count, events.income]
    pivots: [events.gender]
    filters:
      events.income: "-unknown"
    sorts: [events.count desc 0, events.gender]
    limit: 500
    trellis: ''
    stacking: ''
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    refresh: 1 second
    listen: {}
    row: 0
    col: 0
    width: 14
    height: 8
  - title: Ad Events
    name: Ad Events
    model: ref_sol_adtech
    explore: events
    type: table
    fields: [events.advertiser, events.event_name, events.country]
    filters:
      events.advertiser: ''
    sorts: [events.advertiser]
    limit: 100
    show_view_names: 'true'
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    refresh: 1 second
    listen: {}
    row: 8
    col: 14
    width: 9
    height: 10
