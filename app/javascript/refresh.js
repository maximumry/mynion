document.addEventListener('turbo:load', () => {
  setTimeout(() => {
    Turbo.visit(window.location.toString());
  }, 100000);
});
