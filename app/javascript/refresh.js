document.addEventListener('turbo:load', () => {
  if (window.location.pathname === '/') {
    setTimeout(() => {
      Turbo.visit(window.location.toString());
    }, 180000);
  }
});
