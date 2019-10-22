<template>
	<div class="body">
		<header class="top">
			<div class="moon">
				<h1>Dobra Noc</h1>
			</div>
		</header>
		<navbar />
		<router-view />
		<footer />
	</div>
</template>

<script>
	import Navbar from './Navbar.vue'

	export default {
		name: 'App',
		components: {
			Navbar
		}
	}
</script>

<style>
	@import url("https://fonts.googleapis.com/css?family=Comfortaa&display=swap")

	body {
		margin: 0;
		padding: 0;
	}

	.body {
		width: 100%;
		margin: 0;
		padding: 0;
		background-color: #fffff2;
	}

	.body .moon {
		height: 100%;
		width: 40vh;
		background-image: url("/assets/ksiezyc4.png");
		background-size: cover;
		background-repeat: no-repeat;
		margin-left: 80px;
	}

	.body header {
		width: 100%;
		height: 100px;
		background-image: url("/assets/niebo.jpg");
		background-size: cover;
		background-repeat: no-repeat;
	}

	.body footer {
		width: 100%;
		height: 300px;
		background-image: url("/assets/casmirvs.jpg");
		background-size: cover;
		background-repeat: no-repeat;
	}

	.body header h1 {
		margin-top: 26px;
		margin-left: 80px;
		font-family: "Comfortaa", cursive;
		/* nice */
		font-weight: 100;
		font-size: 44px;
		display: inline-block;
		/*color: #113344;*/
		color: #115555;
		text-shadow: 0 0 5px #ffffee;
	}

	.chart {
		margin-bottom: 50px;
	}
</style>
