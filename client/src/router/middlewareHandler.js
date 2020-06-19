/*
 * Admittedly this is a bit convoluted, but it seems to be the most modular
 * way to handle routing middleware.
 *
 * Credit to:
 * https://markus.oberlehner.net/blog/implementing-a-simple-middleware-with-vue-router/
 */
function nextFactory(context, middleware, index) {
  const subsequentMiddleware = middleware[index];

  if (!subsequentMiddleware) {
    return context.next;
  }

  return (...parameters) => {
    context.next(...parameters);
    const nextMiddleware = nextFactory(context, middleware, index + 1);
    subsequentMiddleware({ ...context, next: nextMiddleware });
  };
}

export default function attachMiddlewareHandler(router) {
  console.log("attaching middleware");
  router.beforeEach((to, from, next) => {
    console.log(to.meta);
    // if path 'to' has a middleware array, run middleware function(s)
    if (to.meta.middleware) {
      const middleware = Array.isArray(to.meta.middleware)
        ? to.meta.middleware
        : [to.meta.middleware];

      const passableContext = {
        to,
        from,
        next,
        router
      };

      // create initial nextMiddleware
      const nextMiddleware = nextFactory(passableContext, router, 1);

      return middleware[0]({ ...passableContext, next: nextMiddleware });
    }

    // else
    return next();
  });
}
