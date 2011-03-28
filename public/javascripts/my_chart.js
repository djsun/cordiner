(function($) {
  $.fn.myChart = function(options) {
    var defaults = {
      path: null
    };
    return this.each(function() {
      if(options) { 
        $.extend(defaults, options);
      }
      var chart = new Highcharts.Chart({
        chart: {
          renderTo: this,
          defaultSeriesType: 'line'
        },
        title: {
           text: null
        },
        plotOptions: {
          series: {
            animation: false
          },
          lineWidth: 1,
          line: {
            marker: {
              enabled: false
            }
          },
          shadow: false
        },
        xAxis: {
          title: {
            text: null
          }
        },
        yAxis: {
          title: {
            text: null
          }
        },
        legend: {
          enabled: false
        },
        series: [
          {
            data: []
          }
        ],
        credits: {
          enabled: false
        }
      });
      window.chart = chart;
      $.getJSON(options.path, function(data) {
        chart.addSeries({
          data: data
        });
      });
    });
  };
})(jQuery);
