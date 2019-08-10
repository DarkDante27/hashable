const backToTop = () => {
  const backBtn = document.querySelectorAll('.back-to-top')
  if (backBtn) {
    backBtn.forEach((button) => {
      button.addEventListener('click', (e) => {
        e.preventDefault();
      const navbar = document.querySelector('.navbar-brand');
      if (navbar) {
      navbar.scrollIntoView({ behavior: 'smooth' });
      } else {
        window.location.href = '/'
      }
    })
  })
}
}

export { backToTop };
