<template>
  <div class="sidebar">
    <h1>Sidebar</h1>
    <nav>
      <ul>
        <li>
          <router-link to="/search">Search</router-link>
        </li>
        <li>
          <router-link to="/browse">Browse</router-link>
        </li>
        <li>
          <router-link to="/collections">Collections</router-link>
        </li>
      </ul>
    </nav>

    <hr />
    <button @click="modalOpen">Add</button>
  </div>
</template>

<script>
import Add from "../modal/Add.vue";

export default {
  name: "Sidebar",
  methods: {
    modalOpen() {
      this.$store.dispatch("modalOpen", { component: Add });
    },
  }
};
</script>

<style lang="scss"></style>
