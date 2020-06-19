export default function auth({ next, meta }) {
  console.log("auth middleware: ", meta);

  return next();
}
