<template>
	<div class="form-group col-md-12">
		<select id="inputState" class="form-control" @change="changeLocation($event.target.value)">
			<option v-for="location in locations" :key="location.id">{{location.address}}</option>
		</select>
	</div>
</template>

<script>
	import axios from 'axios'

	axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

	export default {
		data() {
			return {
				locations: null,
				location: {}
			}
		},
		methods: {
			changeLocation: async function(value) {
				this.location = await this.locations.find(x => x.address == value)
				this.$emit('update-location', this.location)
			},
			sendLocation: function (location) {
				this.location = location
				axios.post('/api/v1/settings/location', {
					setting: {
						address: this.location['address'],
						description: this.location['description'],
						longitude: this.location['longitude'],
						latitude: this.location['latitude'],
					}
				}).then(function (response) {
					console.log(response)
					this.$emit('set-location', location)
				}).catch(function (error) {
					console.log(error)
				})
			},
		},
		async mounted() {
			this.loaded = false
			try {
				await fetch("/api/v1/locations").then(response => response.json()).then(data => (this.locations = data))
				this.loaded = true
			} catch (e) {
				console.log(e)
			}
		}
	}
</script>
