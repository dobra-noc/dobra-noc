<template>
<form>
					<div class="form-row">
						<div class="col-md-12 mb-3">
							<label
							  for="validationDefault01"
							  class="col-sm-2 col-form-label col-form-label-lg"
							>Address</label>
							<input
							  type="text"
							  class="form-control form-control-lg"
							  id="validationDefault01"
							  placeholder="Address"
							  required
							  v-model="locationSettings['address']"
							>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6 mb-3">
							<label
							  for="validationDefault04"
							  class="col-sm-2 col-form-label col-form-label-lg"
							>Latitude</label>
							<input
							  type="text"
							  class="form-control form-control-lg"
							  id="validationDefault04"
							  placeholder="Latitude"
							  required
							  v-model="locationSettings['latitude']"
							>
						</div>
						<div class="col-md-6 mb-3">
							<label
							  for="validationDefault05"
							  class="col-sm-2 col-form-label col-form-label-lg"
							>Longitude</label>
							<input
							  type="text"
							  class="form-control form-control-lg"
							  id="validationDefault05"
							  placeholder="Longitude"
							  required
							  v-model="locationSettings['longitude']"
							>
						</div>
					</div>
					<div class="form-row mb-3">
						<label class="col-form-label col-form-label-lg">Description</label>
						<textarea
						  class="form-control form-control-lg"
						  placeholder="Description"
						  v-model="locationSettings['description']"
						></textarea>
					</div>
					<div class="form-group form-check">
						<input
						  type="checkbox"
						  class="form-check-input"
						  id="exampleCheck1"
						  v-model="locationSettings['is_recording']"
						>
						<label
						  class="form-check-label"
						  for="exampleCheck1"
						>Recording</label>
					</div>
					<button
					  class="btn btn-primary"
					  type="submit"
					  @click='setLocationSettings()'
					>Submit location</button>
				</form>
</template>

<script>
import axios from 'axios'
				axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
				export default {
					data: () => ({
						locationSettings: {
							address: '',
							description: '',
							longitude: '',
							latitude: '',
							is_recording: false
						}
					}),
					methods: {
						setLocationSettings: function () {
							axios.post('/api/v1/settings/location', {
								setting: {
									address: this.locationSettings['address'],
									description: this.locationSettings['description'],
									longitude: this.locationSettings['longitude'],
									latitude: this.locationSettings['latitude'],
									is_recording: this.locationSettings['is_recording']
								}
							}).then(function (response) {
								console.log(response);
							}).catch(function (error) {
								console.log(error);
							});
						}
					},
					mounted: async function () {
						const response = await fetch(`/api/v1/settings/get-location`);
						const data = await response.json();
						this.locationSettings = {
							address: data['address'],
							description: data['description'],
							longitude: data['longitude'],
							latitude: data['latitude'],
							is_recording: data['is_recording']
						}
					}
				}
</script>
