<template>
  <div class="nav-buttons-container">
    <button
      :disabled="isDisabledPrevious"
      type="button"
      name="previous"
      class="previous-button nav-buttons"
      @click="navigation('previous')"
    >
      Previous
    </button>
    <button
      :disabled="isDisabledNext"
      type="button"
      name="next"
      class="next-button nav-buttons"
      @click="navigation('next')"
    >
      Next
    </button>
  </div>
</template>

<script>
  export default {
    props: {
      availableDates: Array,
      currentDate: Date
    },
    data() {
      return {
        isDisabledPrevious: false,
        isDisabledNext: false
      }
    },
    watch: {
      currentDate: function(val) {
        let formattedCurrentDate = this.currentDate.getFullYear() + "-" + this.leadingZero((this.currentDate.getMonth() + 1)) + "-" + this.leadingZero(this.currentDate.getDate())
        let navigationPage = this.availableDates.indexOf(formattedCurrentDate)
        if (navigationPage > 0)
          this.isDisabledPrevious = false
        if (navigationPage < this.availableDates.length - 1)
          this.isDisabledNext = false
        if (navigationPage <= 0)
          this.isDisabledPrevious = true
        if (navigationPage == this.availableDates.length - 1)
          this.isDisabledNext = true
      }
    },
    methods: {
      leadingZero: function(date) {
        if (date < 10) {
          return "0" + date
        }else{
          return date
        }
      },
      navigation: function(type) {
        let formattedCurrentDate = this.currentDate.getFullYear() + "-" + this.leadingZero((this.currentDate.getMonth() + 1)) + "-" + this.leadingZero(this.currentDate.getDate())
        if (type == "previous") {
          let navigationPage = this.availableDates.indexOf(formattedCurrentDate) - 1
          if (navigationPage <= 0) {
            this.$emit("navigation-date", 0)
          } else {
            this.$emit("navigation-date", navigationPage)
          }
        }
        if (type == "next") {
          let navigationPage = this.availableDates.indexOf(formattedCurrentDate) + 1

          if (
            navigationPage <= this.availableDates.length - 1 &&
            navigationPage != 0
          ) {
            this.$emit("navigation-date", navigationPage)
          } else if (navigationPage == 0) {
            this.$emit("navigation-date", navigationPage + 1)
          }
        }
      }
    }
  }
</script>

<style>
  .next-button {
    float: right;
  }
  .nav-buttons {
    width: 50%;
    height: 30px;
  }
</style>
