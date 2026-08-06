// ===== Nixon Saavedra — comportamiento compartido =====

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
