import Gauge from "svg-gauge";


const initGauge = () => {
  const gauges = document.querySelectorAll('.cpuSpeed');
  gauges.forEach((gauge) => {
    // Create a new Gauge
    const cpuGauge = Gauge(gauge, {
        max: 100,
        dialStartAngle: -90,
        dialEndAngle: -90.001,
        showValue: true,
        label: function() {
          return gauge.dataset.score;
          },
        value: 50,
        color: function(value) { return "#083358" },
    });
    // Set gauge value
    cpuGauge.setValue(0);
    // Set value and animate (value, animation duration in seconds)
    const score = document.querySelector('#event');
    cpuGauge.setValueAnimated(score.dataset.score);
  })
}

export { initGauge };
