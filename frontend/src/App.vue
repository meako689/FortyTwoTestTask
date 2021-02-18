<template>
  <div class="text-center h-100 m-20">
    <img alt="42 coffee cups logo" src="./assets/logo-light.png" class="w-72 mx-auto mb-5">
    <ping />
  </div>
</template>

<script>
import Ping from '@/components/Ping';

export default {
  name: 'App',
  components: {
    Ping
  }
};
</script>
