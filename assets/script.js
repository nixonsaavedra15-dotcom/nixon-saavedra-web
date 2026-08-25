// ===== Nixon Saavedra — comportamiento compartido =====

// menú móvil (hamburguesa)
const navToggle = document.querySelector('.nav-toggle');
const navLinks = document.querySelector('.navlinks');
if(navToggle && navLinks){
  navToggle.addEventListener('click', ()=>{
    const isOpen = navLinks.classList.toggle('open');
    navToggle.classList.toggle('active', isOpen);
    navToggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    document.body.classList.toggle('nav-open', isOpen);
  });
  // cerrar el menú al tocar un link
  navLinks.querySelectorAll('a').forEach(link=>{
    link.addEventListener('click', ()=>{
      navLinks.classList.remove('open');
      navToggle.classList.remove('active');
      navToggle.setAttribute('aria-expanded', 'false');
      document.body.classList.remove('nav-open');
    });
  });
  // si la ventana crece más allá del punto móvil, cerrar el menú
  window.addEventListener('resize', ()=>{
    if(window.innerWidth > 900){
      navLinks.classList.remove('open');
      navToggle.classList.remove('active');
      navToggle.setAttribute('aria-expanded', 'false');
      document.body.classList.remove('nav-open');
    }
  });
}

// cursor personalizado
const dot = document.getElementById('cdot'), ring = document.getElementById('cring');
if(dot && ring){
  window.addEventListener('mousemove', e=>{
    dot.style.left = e.clientX+'px'; dot.style.top = e.clientY+'px';
    ring.animate({left:e.clientX+'px', top:e.clientY+'px'},{duration:400,fill:'forwards'});
  });
  document.querySelectorAll('a,.course-card,.teaser-card,button').forEach(el=>{
    el.addEventListener('mouseenter',()=>ring.style.transform='translate(-50%,-50%) scale(1.6)');
    el.addEventListener('mouseleave',()=>ring.style.transform='translate(-50%,-50%) scale(1)');
  });
}

// reveal on scroll
const obs = new IntersectionObserver((entries)=>{
  entries.forEach(en=>{ if(en.isIntersecting) en.target.classList.add('in'); });
},{threshold:.15});
document.querySelectorAll('.reveal').forEach(el=>obs.observe(el));

// tilt 3D en tarjetas de curso
document.querySelectorAll('.course-card').forEach(card=>{
  card.addEventListener('mousemove', e=>{
    const r = card.getBoundingClientRect();
    const x = (e.clientX-r.left)/r.width-.5, y=(e.clientY-r.top)/r.height-.5;
    card.style.transform = `perspective(700px) rotateY(${x*6}deg) rotateX(${-y*6}deg) translateY(-4px)`;
  });
  card.addEventListener('mouseleave',()=>card.style.transform='none');
});

// filtro de categorías en Campus
const tabs = document.querySelectorAll('.filter-tabs button');
if(tabs.length){
  tabs.forEach(tab=>{
    tab.addEventListener('click', ()=>{
      tabs.forEach(t=>t.classList.remove('active'));
      tab.classList.add('active');
      const cat = tab.dataset.cat;
      document.querySelectorAll('.course-card').forEach(card=>{
        card.style.display = (cat==='todos' || card.dataset.cat===cat) ? '' : 'none';
      });
    });
  });
}
