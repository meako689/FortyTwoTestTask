<template>
  <div class="text-white">
    Status: <div class="rounded-full h-10 w-10 flex items-center justify-center" :status="`${alive ? 'bg-green-50' : 'bg-red-50'}`" />
  </div>
</template>

<script>
export default {
  name: 'Ping',
  data() {
    return {alive: false, fetchInterval: null};
  },
  mounted() {
    this.fetchInterval = setInterval(this.checkIsAlive, 1000);
  },
  unmounted() {
    this.fetchInterval && clearInterval(this.fetchInterval);
  },
  methods: {
   async checkIsAlive() {
     const response = await fetch('/api/ping');
     if (response.statusCode !== 200) {
       this.alive = false;
     } else {
       const data = await response.json();
       this.alive = data.status;
     }
   }
  },
};
</script>
