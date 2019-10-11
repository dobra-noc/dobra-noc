<template>
  <v-date-picker
    v-model="selectedValue"
    :disabled-dates="[{ start: null, end: null }]"
    :available-dates="availableDates"
    @input="sendDate(selectedValue)"
    :max-date="new Date(availableDates[availableDates.length - 1])"
    :min-date="new Date(availableDates[0])"
    is-inline
    v-if="availableDates"
  >
  </v-date-picker>
</template>

<script>
import { setupCalendar, DatePicker } from "v-calendar";
import "v-calendar/lib/v-calendar.min.css";

setupCalendar({
  firstDayOfWeek: 2
});

export default {
  components: {
    "v-date-picker": DatePicker
  },
  props: {
    availableDates: Array
  },
  methods: {
    sendDate(date) {
      this.$emit("date-value", date);
    }
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
    };
  },
  mounted() {
    this.loaded = true;
  }
};
</script>
