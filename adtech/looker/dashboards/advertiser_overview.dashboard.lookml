- dashboard: advertiser_overview
  title: Advertiser Overview
  layout: newspaper
  elements:
  - title: Activity by Country
    name: Activity by Country
    model: ref_sol_adtech
    explore: events
    type: looker_map
    fields: [events.count, events.country]
    filters:
      events.count: ">200"
    sorts: [events.count desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_zoom: 2
    map_scale_indicator: metric_imperial
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_value_scale_clamp_min: 100
    map_value_scale_clamp_max: 10000
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: circle
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
    refresh: 30 seconds
    listen:
      advertiser: events.advertiser
    row: 9
    col: 0
    width: 16
    height: 16
  - title: Events by Gender
    name: Events by Gender
    model: ref_sol_adtech
    explore: events
    type: looker_pie
    fields: [events.gender, events.count]
    filters: {}
    sorts: [events.count desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    refresh: 15 seconds
    listen:
      advertiser: events.advertiser
    row: 3
    col: 0
    width: 9
    height: 6
  - title: Untitled
    name: Untitled
    model: ref_sol_adtech
    explore: events
    type: single_value
    fields: [events.advertiser]
    filters: {}
    sorts: [events.advertiser]
    limit: 500
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: 'true'
    series_types: {}
    listen:
      advertiser: events.advertiser
    row: 0
    col: 4
    width: 5
    height: 3
  - title: Campaign Activity By Gender
    name: Campaign Activity By Gender
    model: ref_sol_adtech
    explore: events
    type: looker_line
    fields: [events.count, campaigns.campaign_name, events.gender]
    pivots: [events.gender]
    filters: {}
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
    show_view_names: 'true'
    point_style: none
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
    show_null_points: true
    interpolation: linear
    refresh: 15 seconds
    listen:
      advertiser: events.advertiser
    row: 3
    col: 9
    width: 15
    height: 6
  - title: Event Activity By Country
    name: Event Activity By Country
    model: ref_sol_adtech
    explore: events
    type: table
    fields: [events.event_name, events.country, events.count]
    filters: {}
    sorts: [events.count desc]
    limit: 500
    series_types: {}
    refresh: 15 seconds
    listen:
      advertiser: events.advertiser
    row: 9
    col: 16
    width: 8
    height: 16
  - title: Top URLs
    name: Top URLs
    model: ref_sol_adtech
    explore: events
    type: table
    fields: [events.page_url, events.count]
    filters: {}
    sorts: [events.count desc]
    limit: 25
    show_view_names: 'true'
    series_types: {}
    refresh: 15 seconds
    listen:
      advertiser: events.advertiser
    row: 25
    col: 0
    width: 24
    height: 7
  - title: Total Clicks
    name: Total Clicks
    model: ref_sol_adtech
    explore: events
    type: single_value
    fields: [events.count]
    filters:
      events.event_name: Click
    limit: 500
    show_view_names: 'true'
    series_types: {}
    refresh: 3 seconds
    listen:
      advertiser: events.advertiser
    row: 0
    col: 14
    width: 5
    height: 3
  - title: Total Impressions
    name: Total Impressions
    model: ref_sol_adtech
    explore: events
    type: single_value
    fields: [events.count]
    filters: {}
    limit: 500
    show_view_names: 'true'
    series_types: {}
    refresh: 3 seconds
    listen:
      advertiser: events.advertiser
    row: 0
    col: 9
    width: 5
    height: 3
  - title: Click Through Rate
    name: Click Through Rate
    model: ref_sol_adtech
    explore: events
    type: single_value
    fields: [events.click_through_rate]
    limit: 500
    show_view_names: 'true'
    series_types: {}
    refresh: 3 seconds
    listen:
      advertiser: events.advertiser
    row: 0
    col: 19
    width: 5
    height: 3
  filters:
  - name: advertiser
    title: advertiser
    type: field_filter
    default_value: 7-Eleven
    allow_multiple_values: true
    required: false
    model: ref_sol_adtech
    explore: events
    listens_to_filters: []
    field: events.advertiser
