<template>
  <div>
    <h1>I am Recipe {{ id }}</h1>
  </div>
</template>

<script>
export default {
  name: "Recipe",
  props: {
    id: {
      required: true,
      type: String
    }
  }
};
</script>
