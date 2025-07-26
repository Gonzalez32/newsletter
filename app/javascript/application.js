// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

// Bulma navbar burger toggle
// This enables the mobile menu to open/close when the burger is clicked

// Use Turbo's turbo:load event for navbar JS so it works on every page visit

document.addEventListener('turbo:load', () => {
  // Bulma navbar burger toggle
  const $navbarBurgers = Array.from(document.querySelectorAll('.navbar-burger'));
  if ($navbarBurgers.length > 0) {
    $navbarBurgers.forEach(el => {
      el.addEventListener('click', () => {
        const target = el.dataset.target;
        const $target = document.getElementById(target);
        el.classList.toggle('is-active');
        if ($target) $target.classList.toggle('is-active');
      });
    });
  }

  // Collapse navbar menu after clicking a link (on mobile)
  document.querySelectorAll('.navbar-menu .navbar-item').forEach(link => {
    link.addEventListener('click', () => {
      const burger = document.querySelector('.navbar-burger');
      const menu = document.getElementById('navbarBasicExample');
      if (burger && menu && burger.classList.contains('is-active')) {
        burger.classList.remove('is-active');
        menu.classList.remove('is-active');
      }
    });
  });
});

// Newsletter counter - calculates time since July 26th, 2025
document.addEventListener('turbo:load', () => {
  const updateNewsletterCounter = () => {
    const startDate = new Date('2025-07-26'); // July 26th, 2025
    const now = new Date();
    const diffTime = Math.abs(now - startDate);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    const diffYears = Math.floor(diffDays / 365);
    const remainingDays = diffDays % 365;
    
    let timeText = '';
    if (diffYears > 0) {
      timeText = `${diffYears} year${diffYears > 1 ? 's' : ''}`;
      if (remainingDays > 0) {
        timeText += ` and ${remainingDays} day${remainingDays > 1 ? 's' : ''}`;
      }
    } else {
      timeText = `${diffDays} day${diffDays > 1 ? 's' : ''}`;
    }
    
    const counterElement = document.getElementById('newsletter-days');
    if (counterElement) {
      counterElement.textContent = timeText;
    }
  };

  // Update counter immediately
  updateNewsletterCounter();
  
  // Update counter every day (86400000 milliseconds = 24 hours)
  setInterval(updateNewsletterCounter, 86400000);
});

// Auto-update footer year
document.addEventListener('turbo:load', () => {
  const updateFooterYear = () => {
    const yearElement = document.getElementById('current-year');
    if (yearElement) {
      yearElement.textContent = new Date().getFullYear();
    }
  };

  // Update year immediately
  updateFooterYear();
});
