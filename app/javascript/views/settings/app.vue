<template>
	<div class="container">
		<div class="container">
			<recording-button />
		</div>
		<div class="container">
			<location-form :location="location"/>
		</div>
		<div class="container">
			<h3 class="text-center">Choose your location.</h3>
			<location-table @update-location="updateLocation" />
		</div>
	</div>
</template>
<script>
	import LocationForm from './LocationForm.vue'
	import LocationTable from './LocationTable.vue'
	import RecordingButton from './RecordingButton.vue'
	import axios from 'axios'

	axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

	export default {
		components: {
			LocationForm,
			LocationTable,
			RecordingButton
		},
		data: () => ({
			location: null
		}),
		methods: {
			updateLocation: function(value){
				this.location = value
			}
		}
	}
</script>
