module ApplicationHelper
  def revenue_chart(id)
    line_chart(
      {
        labels: %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec],
        datasets: [{
          label: 'Earnings',
          line_tension: 0.3,
          background_color: 'rgba(78, 115, 223, 0.05)',
          border_color: 'rgba(78, 115, 223, 1)',
          point_radius: 3,
          point_background_color: 'rgba(78, 115, 223, 1)',
          point_border_color: 'rgba(78, 115, 223, 1)',
          point_hover_radius: 3,
          point_hover_background_color: 'rgba(78, 115, 223, 1)',
          point_hover_border_color: 'rgba(78, 115, 223, 1)',
          point_hit_radius: 10,
          point_border_width: 2,
          data: [0, 10_000, 5000, 15_000, 10_000, 20_000, 15_000, 25_000, 20_000, 30_000, 25_000, 40_000]
        }]
      },
      maintain_aspect_ratio: false,
      layout: { padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      } },
      scales: {
        x_axes: [{
          time: {
            unit: 'date'
          },
          grid_lines: {
            display: false,
            draw_border: false
          },
          ticks: {
            max_ticks_limit: 7
          }
        }],
        y_axes: [{
          ticks: {
            max_ticks_limit: 5,
            padding: 10,
            # Include a dollar sign in the ticks
            callback: "function (value, index, values) {
                        return '$' + number_format(value);
                      }"
          },
          grid_lines: {
            color: 'rgb(234, 236, 244)',
            zero_line_color: 'rgb(234, 236, 244)',
            draw_border: false,
            border_dash: [2],
            zero_line_border_dash: [2]
          }
        }]
      },
      legend: {
        display: false
      },
      tooltips: {
        background_color: 'rgb(255,255,255)',
        body_font_color: '#858796',
        title_margin_bottom: 10,
        title_font_color: '#6e707e',
        title_font_size: 14,
        border_color: '#dddfeb',
        border_width: 1,
        x_padding: 15,
        y_padding: 15,
        display_colors: false,
        intersect: false,
        mode: 'index',
        caret_padding: 10,
        callbacks: {
          label: "function (tooltipItem, chart) {
                  var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                  return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                 }"
        }
      },
      id: id
    )
  end

  def deal_funnel(id)
    bar_chart(
      {
        labels: %w[Interest Offer Negotiation SPA Paid Closed],
        datasets: [{
          label: 'Deals',
          line_tension: 0.3,
          background_color: 'rgba(78, 115, 223, 0.50)',
          border_color: 'rgba(78, 115, 223, 1)',
          point_radius: 3,
          point_background_color: 'rgba(78, 115, 223, 1)',
          point_border_color: 'rgba(78, 115, 223, 1)',
          point_hover_radius: 3,
          point_hover_background_color: 'rgba(78, 115, 223, 1)',
          point_hover_border_color: 'rgba(78, 115, 223, 1)',
          point_hit_radius: 10,
          point_border_width: 2,
          data: [Deal.last_year.interest.count,
                 Deal.last_year.offer.count,
                 Deal.last_year.negotiation.count,
                 Deal.last_year.sales_purchase_agreement.count,
                 Deal.last_year.amount_paid.count,
                 Deal.last_year.closed.count]
        }]
      },
      maintain_aspect_ratio: false,
      layout: { padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      } },
      scales: {
        x_axes: [{
          time: {
            unit: 'date'
          },
          grid_lines: {
            display: false,
            draw_border: false
          },
          ticks: {
            max_ticks_limit: 7
          }
        }],
        y_axes: [{
          ticks: {
            max_ticks_limit: 5,
            padding: 10
          },
          grid_lines: {
            color: 'rgb(234, 236, 244)',
            zero_line_color: 'rgb(234, 236, 244)',
            draw_border: false,
            border_dash: [2],
            zero_line_border_dash: [2]
          }
        }]
      },
      legend: {
        display: false
      },
      tooltips: {
        background_color: 'rgb(255,255,255)',
        body_font_color: '#858796',
        title_margin_bottom: 10,
        title_font_color: '#6e707e',
        title_font_size: 14,
        border_color: '#dddfeb',
        border_width: 1,
        x_padding: 15,
        y_padding: 15,
        display_colors: false,
        intersect: false,
        mode: 'index',
        caret_padding: 10
      },
      id: id
    )
  end

  def deal_break_down_by_category(id)
    pie_chart(
      {
        labels: %w[Residential Commercial],
        datasets: [{
          data: [Deal.closed.last_year.joins(:property).where(properties: { category: :residential }).count,
                 Deal.closed.last_year.joins(:property).where(properties: { category: :commercial }).count],
          background_color: %w[#4e73df #1cc88a],
          hover_background_color: %w[#2e59d9 #17a673],
          hover_border_color: 'rgba(234, 236, 244, 1)'
        }]
      },
      maintain_aspect_ratio: false,
      tooltips: {
        background_color: 'rgb(255,255,255)',
        body_font_color: '#858796',
        border_color: '#dddfeb',
        border_width: 1,
        x_padding: 15,
        y_padding: 15,
        display_colors: false,
        caret_padding: 10
      },
      legend: {
        display: false
      },
      cutout_percentage: 80,
      id: id
    )
  end

  def deal_break_down_by_property_type(id)
    pie_chart(
      {
        labels: %w[Land House Apartment],
        datasets: [{
          data: [
            Deal.closed.last_year.joins(:property).where(properties: { property_type: :land }).count,
            Deal.closed.last_year.joins(:property).where(properties: { property_type: :house }).count,
            Deal.closed.last_year.joins(:property).where(properties: { property_type: :apartment }).count
          ],
          background_color: %w[#4e73df #1cc88a #36b9cc],
          hover_background_color: %w[#2e59d9 #17a673 #2c9faf],
          hover_border_color: 'rgba(234, 236, 244, 1)'
        }]
      },
      maintain_aspect_ratio: false,
      tooltips: {
        background_color: 'rgb(255,255,255)',
        body_font_color: '#858796',
        border_color: '#dddfeb',
        border_width: 1,
        x_padding: 15,
        y_padding: 15,
        display_colors: false,
        caret_padding: 10
      },
      legend: {
        display: false
      },
      cutout_percentage: 80,
      id: id
    )
  end

  def expandable_list(collection, &block)
    render partial: 'shared/expandable_list',
           locals: { collection: collection, block: block, id: "collapse-#{SecureRandom.uuid}" }
  end
end
