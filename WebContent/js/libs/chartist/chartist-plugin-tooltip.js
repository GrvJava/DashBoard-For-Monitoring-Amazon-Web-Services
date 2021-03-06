/**
 * Chartist.js plugin to display a data label on top of the points in a line chart.
 *
 */
/* global Chartist */
(function (window, document, Chartist) {
    'use strict';

    var defaultOptions = {
        currency: undefined
                // showTooltips: true,
                // tooltipEvents: ['mousemove', 'touchstart', 'touchmove'],
                // labelClass: 'ct-label',
                // labelOffset: {
                //   x: 0,
                //   y: -10
                // },
                // textAnchor: 'middle'
    };

    Chartist.plugins = Chartist.plugins || {};
    Chartist.plugins.tooltip = function (options) {

        options = Chartist.extend({}, defaultOptions, options);

        return function tooltip(chart) {
            var tooltipSelector = '.ct-point';
            if (chart instanceof Chartist.Bar) {
                tooltipSelector = '.ct-bar';
            } else if (chart instanceof Chartist.Pie) {
                tooltipSelector = '.ct-slice';
            }

            var $chart = $(chart.container);
            var $toolTip = $chart
                    .append('<div class="chartist-tooltip"></div>')
                    .find('.chartist-tooltip')
                    .hide();

            $chart.on('mouseenter', tooltipSelector, function () {
                var $point = $(this);
                var tooltipText = '';

                if ($point.attr('ct:meta')) {
                    tooltipText += $point.attr('ct:meta') + '<br>';
                } else {
                    // For Pie Charts also take the labels into account
                    // Could add support for more charts here as well!
                    if (chart instanceof Chartist.Pie) {
                        var label = $point.next('.ct-label');
                        if (label.length > 0) {
                            tooltipText += label.text() + '<br>';
                        }
                    }
                }

                var value = $point.attr('ct:value');
                if (!$.isEmptyObject(options.currency)) {
                    value = options.currency + value.replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,");
                }
                tooltipText += value;

                $toolTip.html(tooltipText).show();
            });

            $chart.on('mouseleave', tooltipSelector, function () {
                $toolTip.hide();
            });

            $chart.on('mousemove', function (event) {
                $toolTip.css({
                    left: (event.offsetX || event.originalEvent.layerX) - $toolTip.width() / 2 - 10,
                    top: (event.offsetY || event.originalEvent.layerY) - $toolTip.height() - 40
                });
            });
        }
    };

}(window, document, Chartist));