<template>
  <div class="container">

    <header class="top">
      <div class="moon">
        <h1>Dobra Noc</h1>
      </div>
    </header>
    <article class="content">
      <span class="marker-info">
        <h1>{{ address }}</h1>
        <Datepicker :available-dates=availableDates></Datepicker>
        <span class="day-time-swith">
          {{ dayTime == true ? 'day' : 'night' }}
          <label class="switch">
            <input type="checkbox" v-model="dayTime">
            <span class="slider round"></span>
          </label>
        </span>
      </span>
      <section class="chart">
        <line-chart
                v-if="loaded"
                :chartdata="chart_data"
                :options="chart_options"
        />
      </section>
      <section>
        <Map @location-id="renderChart"/>
      </section>
    </article>
    <footer>

    </footer>
  </div>
</template>

<script>
    import LineChart from './LineChart.js'
    import Map from './Map.vue'
    import Datepicker from './Datepicker.vue'

    export default {
        name: 'LineChartContainer',
        components: { LineChart, Map, Datepicker },
        data: () => ({
        locationId: null,
        address: null,
        dayTime: true,
        availableDates: null,
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
    methods: {
      async renderChart(value) {
        this.loaded = false
        this.locationId = await value
        try {
            const response = await fetch(`/api/v1/equivalent_continuous_sound_levels/${value}`)
            const data = await response.json()
            this.availableDates = data[1]['dates']
            this.address = data[0][0]['location']['address']
            this.chart_data = {
                datasets: [{
                    data: data[0].map(function (o) {
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

  /* Day Time switch */
  .switch {
    position: relative;
    display: inline-block;
    width: 60px;
    height: 34px;
  }

  .switch input {
    opacity: 0;
    width: 0;
    height: 0;
  }

  .slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgb(29,41,52);
    -webkit-transition: .4s;
    transition: .4s;
  }

  .slider:before {
    position: absolute;
    content: "";
    height: 26px;
    width: 26px;
    left: 4px;
    bottom: 4px;
    background-color: white;
    -webkit-transition: .4s;
    transition: .4s;
  }

  input:checked + .slider {
    background-color: rgb(64,166,119);
  }

  input:focus + .slider {
    box-shadow: 0 0 1px #2196F3;
  }

  input:checked + .slider:before {
    -webkit-transform: translateX(26px);
    -ms-transform: translateX(26px);
    transform: translateX(26px);
  }

  .slider.round {
    border-radius: 34px;
  }

  .slider.round:before {
    border-radius: 50%;
  }
</style>
