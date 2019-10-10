<template>
  <v2-datepicker v-model="date" format="yyyy-MM-DD" lang="en" :picker-options="pickerOptions"></v2-datepicker>
</template>

<script>
  import 'v2-datepicker/lib/index.css'
  import Vue from 'vue';
  import { DatePicker } from 'v2-datepicker';
  Vue.use(DatePicker);

  export default {
    components: { 'v2-datepicker' : DatePicker },
    props: { availableDates: Array },
    data () {
      return {
          date: null,
          pickerOptions: {
              shortcuts: [{
                  text: 'Today',
                  onClick (picker) {
                      picker.$emit('pick', new Date());
                  }
              }, {
                  text: 'Yesterday',
                  onClick (picker) {
                      const date = new Date();
                      date.setTime(date.getTime() - 3600 * 1000 * 24);
                      picker.$emit('pick', date);
                  }
              }, {
                  text: 'A week ago',
                  onClick (picker) {
                      const date = new Date();
                      date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                      picker.$emit('pick', date);
                  }
              }
            ]
          }
        }
      }
    }
</script>
