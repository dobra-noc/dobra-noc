<template>
  <article class="content">
    <h1>{{ address }}</h1>
    <Datepicker
      :available-dates="availableDates"
      @date-value="getDate"
    />
    <section class="chart">
      <line-chart
        v-if="loaded"
        :chartdata="chart_data"
        :options="chart_options"
      />
    </section>
    <section>
      <Map @location-id="renderChart" />
    </section>
  </article>
</template>

<script>
import LineChart from "./LineChart.js";
import Map from "./Map.vue";
import Datepicker from "./Datepicker.vue";

export default {
  name: "LineChartContainer",
  components: {
    LineChart,
    Map,
    Datepicker,
  },
  data: () => ({
    locationId: null,
    availableDates: null,
    date: null,

    address: null,
    loaded: false,
    chart_data: null,
    chart_options: {
      responsive: true,
      aspectRatio: 3,
      maintainAspectRatio: false,
      scales: {
        xAxes: [
          {
            type: "time",
            time: {
              unit: "hour"
            }
          }
        ],
        yAxes: [
          {
            ticks: {
              beginAtZero: true
            }
          }
        ]
      }
    }
  }),
  methods: {
    fillChartData(data) {
      this.chart_data = {
        datasets: [
          {
            data: data.map(function(o) {
              return {
                t: new Date(o.start_at),
                y: o.laeq
              };
            }),
            fill: false,
            label: "Equivalent continuous sound level",
            backgroundColor: "#115555",
            borderColor: "#115555"
          }
        ]
      };
    },
    async renderChart(value) {
      this.loaded = false;
      this.locationId = await value;
      try {
        const response = await fetch(
          `/api/v1/equivalent_continuous_sound_levels/${value}`
        );
        const data = await response.json();
        this.availableDates = data[1]["dates"];
        this.address = data[0][0]["location"]["address"];
        this.fillChartData(data[0]);
        this.loaded = true;
      } catch (e) {
        console.error(e);
      }
    },
    async getDate(value) {
      this.loaded = false;
      this.date = await value;
      try {
        const response = await fetch(
          `/api/v1/equivalent_continuous_sound_levels/${this.locationId}/${value}`
        );
        const data = await response.json();
        this.fillChartData(data);
        this.loaded = true;
      } catch (e) {
        console.error(e);
      }
    }
  }
};
</script>
