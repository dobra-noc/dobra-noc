<template>
	<div class="container">
		<div class="container">
			<h3 class="text-center">Choose your location.</h3>
			<location-table @update-location="updateLocation" />
		</div>
		<Map @current-location="currentLocation" />
		<div class="container">
			<location-form :location="location" :latlng="latlng"/>
		</div>
	</div>
</template>
<script>
	import LocationForm from './LocationForm.vue'
	import LocationTable from './LocationTable.vue'
	import axios from 'axios'
	import Map from './Map.vue'

	axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

	export default {
		components: {
			LocationForm,
			LocationTable,
			Map
		},
		data: () => ({
			location: null,
			latlng: {}
		}),
		methods: {
			updateLocation: function(value){
				this.location = value
			},
			currentLocation: function(value) {
				this.latlng = value
			}
		}
	}
</script>
