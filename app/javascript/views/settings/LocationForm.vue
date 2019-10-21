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
							>
						</div>
					</div>
					<div class="form-row mb-3">
						<label class="col-form-label col-form-label-lg">Description</label>
						<textarea
						  class="form-control form-control-lg"
						  placeholder="Description"
						></textarea>
					</div>
					<button
					  class="btn btn-primary"
					  type="submit"
					>Submit location</button>
				</form>
</template>

<script>

</script>
