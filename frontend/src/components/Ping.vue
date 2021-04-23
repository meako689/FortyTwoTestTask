<template>
  <div class="text-white flex items-center justify-center">
    <span class="text-xl">API Status:</span>&nbsp;
    <div
      class="rounded-full h-10 w-10 inline-block font-mono flex items-center justify-center"
      :class="[alive === undefined ? 'bg-gray-500' : alive ? 'bg-green-500' : 'bg-red-500']"
    >
      {{ statusCode }}
    </div>
  </div>
</template>

<script>
export default {
  name: 'Ping',
  data() {
    return {alive: undefined, fetchInterval: null, statusCode: '---'};
  },
  mounted() {
    this.fetchInterval = setInterval(this.checkIsAlive, 1000);
  },
  unmounted() {
    this.fetchInterval && clearInterval(this.fetchInterval);
  },
  methods: {
   async checkIsAlive() {
     const response = await fetch('/api/hello/ping/');
     this.statusCode = response.status;
     if (response.status !== 200) {
       this.alive = false;
     } else {
       const data = await response.json();
       this.alive = data.status;
     }
   }
  },
};
</script>
