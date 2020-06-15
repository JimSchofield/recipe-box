<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <h1>Recipe-box</h1>
    <button @click="login">Log in!</button>
    <pre>{{ $store.state.userModule.loggedIn.toString() }}</pre>
  </div>
</template>

<script>
export default {
  name: "Home",
  methods: {
    login() {
      this.$store.dispatch("LOGIN");
    }
  }
};
</script>
