<template>
  <div
    v-if="availableDates"
    class="date-container"
  >
    <v-date-picker
      v-model="selectedValue"
      :disabled-dates="[{ start: null, end: null }]"
      :available-dates="availableDates"
      :max-date="new Date(availableDates[availableDates.length - 1])"
      :min-date="new Date(availableDates[0])"
      is-inline
      @input="sendDate(selectedValue)"
    />
    <CalendarNavigation
      :available-dates="availableDates"
      :current-date="selectedValue"
      @navigation-date="setDate"
    />
  </div>
</template>

<script>
  import { setupCalendar, DatePicker } from "v-calendar"
  import "v-calendar/lib/v-calendar.min.css"
  import CalendarNavigation from "./CalendarNavigation.vue"

  setupCalendar({
    firstDayOfWeek: 2,
    navVisibility: "hover"
  })

  export default {
    components: {
      "v-date-picker": DatePicker,
      CalendarNavigation
    },
    props: {
      availableDates: Array
    },
    data() {
      return {
        selectedValue: new Date(),
        attrs: [
          {
            key: "today",
            dates: "19-10-2019",
            highlight: {
              backgroundColor: "#ff8080"
            }
          }
        ]
      }
    },
    methods: {
      sendDate(date) {
        this.$emit("date-value", date)
      },
      setDate(value) {
        this.selectedValue = new Date(this.availableDates[value])
        this.sendDate(this.selectedValue)
      }
    }
  };
</script>
<style>
.date-container {
  float: left;
  display: inline-block;
}
</style>
