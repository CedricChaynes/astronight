import Gauge from "svg-gauge";


const initGauge = () => {
  const gauges = document.querySelectorAll('.cpuSpeed');
  gauges.forEach((gauge) => {
    // Create a new Gauge
    const score = Number(gauge.dataset.score) *100;
    const cpuGauge = Gauge(gauge, {
        max: 100,
        dialStartAngle: -90,
        dialEndAngle: -90.001,
        showValue: true,
        label: function() {
          return score + "%";
          },
        value: score,
        color: function(value) {
          if(value < 90) {
            return "#ffbf00"; // yellow
          } else {
            return "#238823"; // green
          }
        }
    });
    // Set gauge value
    cpuGauge.setValue(0);
    // Set value and animate (value, animation duration in seconds)
    cpuGauge.setValueAnimated(score, 2);
  })
}

export { initGauge };
