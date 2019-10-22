<template>
<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">Address</th>
							<th scope="col">Latitude</th>
							<th scope="col">Longitude</th>
						</tr>
					</thead>
					<tbody>
						<tr
						  v-for="location in locations"
						  @click="sendLocation(location)"
						>
							<th scope="row">{{location.address}}</th>
							<td>{{location.latitude}}</td>
							<td>{{location.longitude}}</td>
						</tr>
					</tbody>
				</table>
</template>
<script>
import axios from 'axios'
				axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
				export default {
					data() {
						return {
							locations: null,
							location: null
						}
					},
					methods: {
						sendLocation: function (location) {
							this.location = location
							axios.post('/api/v1/settings/location', {
								setting: {
									address: this.location['address'],
									description: this.location['description'],
									longitude: this.location['longitude'],
									latitude: this.location['latitude'],
									is_recording: this.location['is_recording']
								}
							}).then(function (response) {
								console.log(response);
							}).catch(function (error) {
								console.log(error);
							});
						},
					},
					async mounted() {
						this.loaded = false;
						try {
							await fetch("/api/v1/locations").then(response => response.json()).then(data => (this.locations = data));
							this.loaded = true;
						} catch (e) {
							console.log(e);
						}
					}
				}
</script>
