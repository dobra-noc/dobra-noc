<template>
  <div class="container">
    <button
      type="button"
      name="button"
      v-bind:class="[isRecording ? 'btn btn-lg btn-danger' : 'btn btn-lg btn-light']"
      @click="setRecordingStatus()"
    >
      {{recordingMessage}}
    </button>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data: () => ({
      isRecording: false,
      recordingMessage: 'Not recording'
    }),
    watch: {
      isRecording: function(val) {
        this.recordingMessage = (val ? 'Recording' : 'Not recording')
      }
    },
    methods: {
      getRecordingStatus: async function() {
        try {
          const response = await fetch(`http://${window.location.host}/api/v1/settings/is-recording`)
          this.isRecording = await response.json()
        } catch (e) {
          console.error(e)
        }
      },
      setRecordingStatus: async function() {
        this.isRecording = this.isRecording ? false : true

        axios.post(`http://${window.location.host}/api/v1/settings/recording`, {
					setting: {
						is_recording: this.isRecording
					}
				}).then(function (response) {
					console.log(response)
				}).catch(function (error) {
					console.log(error)
				});
      }
    },
    mounted: function() {
      this.getRecordingStatus()
    }
  }
</script>
