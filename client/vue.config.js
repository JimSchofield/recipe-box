module.exports = {
  css: {
    loaderOptions: {
      sass: {
        prependData: `@import "src/styles/_vars.scss";`
      }
    }
  }
};
