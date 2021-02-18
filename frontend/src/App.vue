<template>
  <div class="text-center">
    <img alt="42 coffee cups logo" src="./assets/logo-light.png">
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
