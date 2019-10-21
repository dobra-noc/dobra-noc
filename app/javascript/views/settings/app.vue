<template>
<div class="container">
					<div class="container">
						<h3 class="text-center">Choose your location.</h3>
						<location-table />
					</div>
					<h3 class="text-center">If it isn't on list fill form.</h3>
					<location-form />
				</div>
</template>
<script>
import LocationForm from './LocationForm.vue'
				import LocationTable from './LocationTable.vue'
				export default {
					components: {
						LocationForm,
						LocationTable
					}
				}
</script>
