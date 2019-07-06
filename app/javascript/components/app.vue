<template>
  <div class="container">

    <header class="top">
      <div class="moon">
        <h1>Dobra Noc</h1>
      </div>
    </header>
    <article class="content">
      <section class="chart">
        <line-chart
                v-if="loaded"
                :chartdata="chart_data"
                :options="chart_options"
        />
      </section>
      <section>
        <Map />
      </section>
    </article>
    <footer>

    </footer>
  </div>
</template>

<script>
    import LineChart from './LineChart.js'
    import Map from './Map.vue'

    export default {
        name: 'LineChartContainer',
        components: { LineChart, Map },
        data: () => ({
        loaded: false,
        chart_data: null,
        chart_options: {
            responsive: true,
            aspectRatio: 3,
            maintainAspectRatio: false,
            scales: {
                xAxes: [{
                    type: 'time',
                    time: {
                        unit: 'hour'
                    }
                }],
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }],
            }
        }
    }),
    async mounted () {
        this.loaded = false
        try {
            const response = await fetch('/api/v1/equivalent_continuous_sound_levels')
            const data = await response.json()
            this.chart_data = {
                datasets: [{
                    data: data.map(function (o) {
                        return {t: new Date(o.start_at), y: o.laeq}
                    }),
                    fill: false,
                    label: "Equivalent continuous sound level",
                    backgroundColor: "#115555",
                    borderColor: "#115555"
                }]
            }
            this.loaded = true
        } catch (e) {
            console.error(e)
        }
    }
    }
</script>

<style>
  @import url('https://fonts.googleapis.com/css?family=Comfortaa&display=swap');
  body {
    margin: 0;
    padding: 0
  }
  .container {
    width: 100%;
    margin: 0;
    padding: 0;
    background-color: #fffff2;
  }
  .container .moon {
    height: 100px;
    width: 400px;
    background-image: url("/assets/ksiezyc4.png");
    background-size: cover;
    background-repeat: no-repeat;
    margin-left: 80px;
  }
  .container header {
    width: 100%;
    height: 100px;
    background-image: url("/assets/niebo.jpg");
    background-size: cover;
    background-repeat: no-repeat;
  }
  .container footer {
    width: 100%;
    height: 300px;
    background-image: url("/assets/casmirvs.jpg");
    background-size: cover;
    background-repeat: no-repeat;
  }
  .container header h1 {
    margin-top: 26px;
    margin-left: 80px;
    font-family: 'Comfortaa', cursive; /* nice */
    font-weight: 100;
    font-size: 44px;
    display: inline-block;
    /*color: #113344;*/
    color: #115555;
    text-shadow: 0 0 5px #ffffee;
  }
  .content {
    margin: 50px;
  }
  .chart {
    margin-bottom: 50px
  }
</style>