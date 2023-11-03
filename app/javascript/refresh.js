document.addEventListener('turbo:load', () => {
  console.log("1")
  if (window.location.pathname === '/') {
    console.log("2")
    setTimeout(() => {
      Turbo.visit(window.location.toString());
    }, 30000);
  }
});
