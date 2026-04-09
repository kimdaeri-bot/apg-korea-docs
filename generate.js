#!/usr/bin/env node
/**
 * Airline page generator
 * Usage: node generate.js
 * Reads airlines-data.json, creates HTML pages + index.html
 */
const fs = require('fs');
const path = require('path');
const dir = path.join(__dirname, 'airlines');
fs.mkdirSync(dir, { recursive: true });

const HTML = `<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>__TITLE__ — APG Korea</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Apple SD Gothic Neo','Noto Sans KR',-apple-system,sans-serif;background:#0b0f19;color:#e0e4ed}
.back{display:inline-flex;align-items:center;gap:6px;color:#6e8efb;text-decoration:none;font-weight:600;font-size:.9rem;padding:20px 28px}
.back:hover{text-decoration:underline}
.hero{position:relative;overflow:hidden;background:#0b0f19}
.hero img{width:100%;height:auto;display:block;margin:0 auto;filter:brightness(.9)}
.content{max-width:760px;margin:0 auto;padding:0 20px 40px}
.copy-area{position:relative;background:#141825;border-radius:16px;padding:28px 30px;margin-bottom:20px;border:1px solid #1e2435;line-height:1.85;font-size:.95rem;white-space:pre-wrap;color:#b8c0d0}
.copy-area strong{color:#e0e4ed}
.copy-btn{position:absolute;top:12px;right:12px;background:#6e8efb;color:#fff;border:none;padding:6px 14px;border-radius:8px;font-size:.75rem;font-weight:700;cursor:pointer}
.copy-btn:hover{background:#5a7de8}
.copy-btn.copied{background:#22c55e}
.footer{text-align:center;padding:28px;color:#2a3555;font-size:.72rem;border-top:1px solid #141825}
</style>
</head>
<body>
<a class="back" href="../index.html">← APG Korea 문서함</a>
<div class="hero"><img src="__IMG__" alt="__NAME__"></div>
<div class="content">
  <div class="copy-area" id="copyText">
    <button class="copy-btn" onclick="copyText()">📋 복사</button>__POST__
</div>
</div>
<div class="footer">© 2026 APG Korea · Internal Use Only · kimdaeri-bot/apg-korea-docs</div>
<script>
function copyText(){const el=document.getElementById('copyText');const text=el.innerText.replace('📋 복사','').trim();navigator.clipboard.writeText(text).then(()=>{const btn=el.querySelector('.copy-btn');btn.textContent='✅ 복사됨!';btn.classList.add('copied');setTimeout(()=>{btn.textContent='📋 복사';btn.classList.remove('copied');},2000);});}
</script>
</body>
</html>`;

function generatePage(a) {
  const code = a.code ? ` (${a.code})` : '';
  const post = `✈️ ${a.en}${code}

${a.flag} ${a.country}의 국적항공사, <strong>${a.en}(${a.kr})</strong>을 소개합니다!

${a.desc}

🛫 허브 공항: ${a.hub} (${a.hubCode})
🤝 동맹: ${a.alliance}
🛩️ 운용 기재: ${a.fleet}
🗺️ 취항지: ${a.dest}개 도시

📍 주요 노선: ${a.routes}

✨ ${a.country}를 대표하는 항공사로서, ${a.dest}개 이상의 목적지를 연결합니다.

📍${a.en}은 GP-275를 통해 예약 및 발권 가능하며, 전 세계 여행사들이 쉽게 접근할 수 있도록 APG가 함께합니다.

APG Korea는 전 세계 170개국, 100개 이상의 글로벌 네트워크를 기반으로 APG Airlines를 통해 ${a.en}${code} 항공권의 BSP 발권을 지원합니다.

📧 문의: sales@apg-ga.co.kr

#${a.en.replace(/\s/g,'')} #${a.kr} #APGKorea #GP275 #항공사소개`;

  return HTML
    .replace(/__TITLE__/g, `${a.en} ${a.code}`)
    .replace(/__IMG__/g, a.img)
    .replace(/__NAME__/g, a.en)
    .replace(/__POST__/g, post);
}

// Load data
const data = JSON.parse(fs.readFileSync(path.join(__dirname, 'airlines-data.json'), 'utf8'));

// Generate pages
let count = 0;
for (const a of data) {
  const html = generatePage(a);
  const file = path.join(dir, `${a.slug}.html`);
  fs.writeFileSync(file, html);
  count++;
}
console.log(`Generated ${count} airline pages`);

// Group by region
const regions = {};
for (const a of data) {
  if (!regions[a.region]) regions[a.region] = [];
  regions[a.region].push(a);
}

// Add existing Aegean
const aegeanCard = `<a class="card" href="airlines/aegean-airlines.html">
  <img src="https://upload.wikimedia.org/wikipedia/commons/2/27/SX-NEC_A320NEO_Aegean_LHR_4.11.20.jpg" alt="Aegean Airlines">
  <div class="card-body">
    <h3>에게항공 <span class="code">A3</span></h3>
    <div class="hub">허브: 아테네 (ATH) · 그리스</div>
    <p>그리스 국적항공사. 스타얼라이언스 멤버로 유럽 150+ 도시 연결.</p>
    <div class="meta">
      <span>Star Alliance</span>
      <span>유럽</span>
    </div>
  </div>
</a>`;

const regionNames = {
  americas: '🌎 아메리카 (Americas)',
  asia: '🌏 아시아·오세아니아 (Asia & Oceania)',
  middleeast: '🕌 중동·중앙아시아 (Middle East & Central Asia)',
  africa: '🌍 아프리카 (Africa)',
  europe: '🇪🇺 유럽 (Europe)'
};

const regionOrder = ['americas', 'asia', 'middleeast', 'africa', 'europe'];

function makeCard(a) {
  const codeSpan = a.code ? `<span class="code">${a.code}</span>` : '';
  return `<a class="card" href="airlines/${a.slug}.html">
  <img src="${a.img}" alt="${a.en}">
  <div class="card-body">
    <h3>${a.flag} ${a.kr} ${codeSpan}</h3>
    <div class="hub">허브: ${a.hub} (${a.hubCode}) · ${a.country}</div>
    <p>${a.desc.substring(0, 80)}...</p>
    <div class="meta">
      <span>${a.alliance}</span>
      <span>${a.fleet.split(',')[0]}</span>
    </div>
  </div>
</a>`;
}

let sections = '';
for (const rg of regionOrder) {
  const airlines = regions[rg] || [];
  let cards = '';
  if (rg === 'europe') cards = aegeanCard;
  for (const a of airlines) cards += makeCard(a);
  sections += `
  <div class="section">
    <div class="section-title">${regionNames[rg]} — ${rg === 'europe' ? airlines.length + 1 : airlines.length} 항공사</div>
    <div class="grid">${cards}</div>
  </div>`;
}

const indexHTML = `<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>APG Korea — GP-275 항공사 목록</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Apple SD Gothic Neo','Noto Sans KR',-apple-system,sans-serif;background:#f8f9fa;color:#333}
header{background:linear-gradient(135deg,#0a1628,#1a2744);color:#fff;padding:48px 24px 36px;text-align:center}
header h1{font-size:1.8rem;font-weight:900;margin-bottom:6px;letter-spacing:-0.5px}
header .sub{font-size:0.85rem;opacity:.5;margin-bottom:4px}
header .badge{display:inline-block;background:rgba(255,255,255,.1);border:1px solid rgba(255,255,255,.15);padding:4px 14px;border-radius:20px;font-size:.75rem;margin-top:10px}
.container{max-width:960px;margin:0 auto;padding:40px 20px}
.section{margin-bottom:40px}
.section-title{font-size:13px;font-weight:700;color:#6a8aaa;letter-spacing:1px;text-transform:uppercase;margin-bottom:16px;padding-bottom:8px;border-bottom:1px solid #e5e7eb}
.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:20px}
.card{background:#fff;border-radius:14px;overflow:hidden;box-shadow:0 1px 8px rgba(0,0,0,.06);text-decoration:none;color:inherit;display:block;transition:transform .2s,box-shadow .2s}
.card:hover{transform:translateY(-2px);box-shadow:0 8px 24px rgba(0,0,0,.1)}
.card img{width:100%;height:200px;object-fit:cover;background:#ddd}
.card-body{padding:20px}
.card-body h3{font-size:1.05rem;font-weight:800;margin-bottom:2px;display:flex;align-items:center;gap:6px}
.card-body h3 .code{color:#e63946;font-weight:700;font-size:.85rem}
.card-body .hub{color:#888;font-size:.8rem;margin-bottom:10px}
.card-body p{font-size:.9rem;line-height:1.65;color:#555}
.card-body .meta{margin-top:14px;display:flex;flex-wrap:wrap;gap:6px}
.card-body .meta span{background:#eef2ff;color:#4f46e5;padding:3px 10px;border-radius:16px;font-size:.75rem;font-weight:600}
.footer{text-align:center;padding:30px;color:#bbb;font-size:.75rem}
</style>
</head>
<body>
<header>
  <h1>✈️ APG Korea</h1>
  <div class="sub">GP-275 항공사 소개 · Instagram 컨텐츠</div>
  <div class="badge">157 Airlines · 5 Regions</div>
</header>
<div class="container">${sections}</div>
<div class="footer">© 2026 APG Korea · Internal Use Only · kimdaeri-bot/apg-korea-docs</div>
</body>
</html>`;

fs.writeFileSync(path.join(__dirname, 'index.html'), indexHTML);
console.log('Updated index.html');
