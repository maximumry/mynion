document.addEventListener('turbo:load', () => {
  setTimeout(() => {
    Turbo.visit(window.location.toString());
  }, 10000);
});
