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
        <li>
          <router-link to="/add">Add</router-link>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {
  name: "Sidebar"
};
</script>

<style lang="scss">

</style>
