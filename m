<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>Happy National Boyfriend's Day — Letter</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;600&family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet">
<style>
:root{--bg:#fff7f9;--card:#fff;--accent:#ff6b81;--text:#222}
*{box-sizing:border-box}
body{margin:0;min-height:100vh;display:flex;align-items:center;justify-content:center;background:linear-gradient(135deg,var(--bg),#fff);font-family:Montserrat,system-ui,Arial}
.card{width:min(860px,94vw);padding:28px;border-radius:18px;box-shadow:0 8px 30px rgba(0,0,0,.12);background:var(--card);display:flex;gap:24px;flex-direction:column}
.header{display:flex;align-items:center;gap:12px}
.heart{font-size:28px;color:var(--accent)}
.title{font-weight:600;font-size:22px}
.letter{background:linear-gradient(180deg,rgba(255,255,255,0.7),rgba(255,255,255,0.9));padding:20px;border-radius:12px;border:1px dashed rgba(0,0,0,0.05)}
.letter p{margin:10px 0;line-height:1.5;color:var(--text)}
.signature{font-family:Dancing Script, cursive;font-size:28px;margin-top:8px;color:var(--accent)}
.controls{display:flex;gap:10px;flex-wrap:wrap;align-items:center}
button{cursor:pointer;padding:8px 12px;border-radius:999px;border:none;background:var(--accent);color:white;font-weight:600}
.small{font-size:14px;color:#666}
@media(min-width:880px){.card{flex-direction:row;align-items:flex-start}}
.left{flex:1}
.right{width:260px;display:flex;flex-direction:column;gap:12px;align-items:center}
.photo{width:200px;height:200px;border-radius:12px;object-fit:cover;box-shadow:0 6px 18px rgba(0,0,0,.08)}
</style>
</head>
<body>
<main class="card" role="main" aria-labelledby="pageTitle">
  <section class="left">
    <header class="header">
      <div class="heart">💌</div>
      <h1 id="pageTitle" class="title">A Letter for <span id="recipient">[Your Love]</span></h1>
    </header>

    <article class="letter" id="letter">
      <p>Hey <strong><span id="recipientInline">[Your Love]</span></strong>,</p>
      <p>Happy National Boyfriend's Day! I wanted to make something special — a little page just for you. You mean so much to me and I love how you make everyday brighter.</p>
      <p>Today I remember the small things: your laugh, how you make me coffee, the way you say my name. Thank you for being you — loving, patient, kind. I'm so lucky to have you.</p>
      <p class="signature">Love, <span id="sender">[Your Name]</span></p>
    </article>

    <div class="controls">
      <button id="printBtn">Print / Save as PDF</button>
      <button id="copyLinkBtn">Copy shareable link</button>
      <div class="small" id="linkHint">Tip: add <code>?name=Nick</code> to the URL to personalize.</div>
    </div>
  </section>

  <aside class="right">
    <img id="photo" class="photo" src="images/sample.jpg" alt="Photo (replace in repo)" onerror="this.style.display='none'">
    <div class="small">Replace the image by uploading `images/yourphoto.jpg` to the repo and updating the src.</div>
  </aside>
</main>

<script>
(function(){
  const params = new URLSearchParams(location.search);
  const name = params.get('name');
  const sender = params.get('from');
  const msg = params.get('message');

  function setText(selector, value){ if(value) document.querySelectorAll(selector).forEach(el => el.textContent = value); }

  setText('#recipient', name);
  setText('#recipientInline', name);
  setText('#sender', sender);

  if(msg){
    const letter = document.getElementById('letter');
    const bodyHtml = '<p>Hey <strong>' + (name || '[Your Love]') + '</strong>,</p><p>' + msg.replace(/\n/g, '</p><p>') + '</p><p class="signature">Love, <span id="sender">' + (sender || '[Your Name]') + '</span></p>';
    letter.innerHTML = bodyHtml;
  }

  document.getElementById('printBtn').addEventListener('click', ()=> window.print());

  document.getElementById('copyLinkBtn').addEventListener('click', async ()=>{
    try{
      await navigator.clipboard.writeText(location.href);
      const hint = document.getElementById('linkHint');
      const prev = hint.textContent;
      hint.textContent = 'Link copied! Paste it to message.';
      setTimeout(()=> hint.textContent = prev,2500);
    }catch(e){
      alert('Could not copy automatically — highlight the URL and copy it.');
    }
  });
})();
</script>
</body>
</html>
