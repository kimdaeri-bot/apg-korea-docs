#!/usr/bin/env python3
"""build-all.py - Read airlines-data.json, generate HTML pages + index.html"""
import json, os

D = os.path.dirname(os.path.abspath(__file__))
ADIR = os.path.join(D, "airlines")
os.makedirs(ADIR, exist_ok=True)

with open(os.path.join(D, "airlines-data.json")) as f:
    A = json.load(f)

print(f"Total airlines: {len(A)}")

JS = "function copyText(){var el=document.getElementById('copyText');var text=el.innerText.replace('\\ud83d\\udccb \\ubcf5\\uc0ac','').trim();navigator.clipboard.writeText(text).then(function(){var btn=el.querySelector('.copy-btn');btn.textContent='\\u2705 \\ubcf5\\uc0ac\\ub418\\uc5c8\\uc2b5\\ub2c8\\ub2e4!';btn.classList.add('copied');setTimeout(function(){btn.textContent='\\ud83d\\udccb \\ubcf5\\uc0ac';btn.classList.remove('copied');},2000);});}"

def gen_html(a):
    cs = f" ({a['code']})" if a['code'] else ""
    post = f"✈️ {a['en']}{cs}\n\n{a['fl']} {a['co']}의 국적항공사, <strong>{a['en']}({a['kr']})</strong>을 소개합니다!\n\n{a['ds']}\n\n🛫 허브 공항: {a['hub']} ({a['hc']})\n🤝 동맹: {a['al']}\n🛩️ 운용 기재: {a['fw']}\n🗺️ 취항지: {a['dest']}개 도시\n\n📍 주요 노선: {a['rt']}\n\n✨ {a['co']}를 대표하는 항공사로서, {a['dest']}개 이상의 목적지를 연결합니다.\n\n📍{a['en']}은 GP-275를 통해 예약 및 발권 가능하며, 전 세계 여행사들이 쉽게 접근할 수 있도록 APG가 함께합니다.\n\nAPG Korea는 전 세계 170개국, 100개 이상의 글로벌 네트워크를 기반으로 APG Airlines를 통해 {a['en']}{cs} 항공권의 BSP 발권을 지원합니다.\n\n📧 문의: sales@apg-ga.co.kr\n\n#{a['en'].replace(' ','')} #{a['kr']} #APGKorea #GP275 #항공사소개"

    html = f"""<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{a['en']} {a['code']} — APG Korea</title>
<style>
*{{margin:0;padding:0;box-sizing:border-box}}
body{{font-family:'Apple SD Gothic Neo','Noto Sans KR',-apple-system,sans-serif;background:#0b0f19;color:#e0e4ed}}
.back{{display:inline-flex;align-items:center;gap:6px;color:#6e8efb;text-decoration:none;font-weight:600;font-size:.9rem;padding:20px 28px}}
.back:hover{{text-decoration:underline}}
.hero{{position:relative;overflow:hidden;background:#0b0f19}}
.hero img{{width:100%;height:auto;display:block;margin:0 auto;filter:brightness(.9)}}
.content{{max-width:760px;margin:0 auto;padding:0 20px 40px}}
.copy-area{{position:relative;background:#141825;border-radius:16px;padding:28px 30px;margin-bottom:20px;border:1px solid #1e2435;line-height:1.85;font-size:.95rem;white-space:pre-wrap;color:#b8c0d0}}
.copy-area strong{{color:#e0e4ed}}
.copy-btn{{position:absolute;top:12px;right:12px;background:#6e8efb;color:#fff;border:none;padding:6px 14px;border-radius:8px;font-size:.75rem;font-weight:700;cursor:pointer}}
.copy-btn:hover{{background:#5a7de8}}
.copy-btn.copied{{background:#22c55e}}
.footer{{text-align:center;padding:28px;color:#2a3555;font-size:.72rem;border-top:1px solid #141825}}
</style>
</head>
<body>
<a class="back" href="../index.html">← APG Korea 문서함</a>
<div class="hero"><img src="{a['img']}" alt="{a['en']}"></div>
<div class="content">
  <div class="copy-area" id="copyText">
    <button class="copy-btn" onclick="copyText()">📋 복사</button>{post}
</div>
</div>
<div class="footer">© 2026 APG Korea · Internal Use Only · kimdaeri-bot/apg-korea-docs</div>
<script>{JS}</script>
</body>
</html>"""
    with open(os.path.join(ADIR, f"{a['slug']}.html"), "w") as f:
        f.write(html)

for airline in A:
    gen_html(airline)
print(f"Generated {len(A)} airline HTML pages")

# Index
regions = {}
for a in A:
    regions.setdefault(a['rg'], []).append(a)

rn = {"americas":"🌎 아메리카","asia":"🌏 아시아·오세아니아","middleeast":"🕌 중동·중앙아시아","africa":"🌍 아프리카","europe":"🇪🇺 유럽"}
ro = ["americas","asia","middleeast","africa","europe"]

def cd(a):
    c = f'<span class="code">{a["code"]}</span>' if a["code"] else ""
    return f'<a class="card" href="airlines/{a["slug"]}.html"><img src="{a["img"]}" alt="{a["en"]}" loading="lazy"><div class="card-body"><h3>{a["fl"]} {a["kr"]} {c}</h3><div class="hub">허브: {a["hub"]} ({a["hc"]}) · {a["co"]}</div><p>{a["ds"][:80]}</p><div class="meta"><span>{a["al"]}</span><span>{a["fw"].split(",")[0]}</span></div></div></a>'

aegean = '<a class="card" href="airlines/aegean-airlines.html"><img src="https://upload.wikimedia.org/wikipedia/commons/2/27/SX-NEC_A320NEO_Aegean_LHR_4.11.20.jpg" alt="Aegean Airlines" loading="lazy"><div class="card-body"><h3>🇬🇷 에게항공 <span class="code">A3</span></h3><div class="hub">허브: 아테네 (ATH) · 그리스</div><p>그리스 국적항공사. 스타얼라이언스 멤버로 유럽 150+ 도시 연결.</p><div class="meta"><span>Star Alliance</span><span>A320neo</span></div></div></a>'

secs = ""
for rg in ro:
    als = regions.get(rg, [])
    cards = (aegean + "".join(cd(x) for x in als)) if rg == "europe" else "".join(cd(x) for x in als)
    n = len(als) + (1 if rg == "europe" else 0)
    secs += f'<div class="section"><div class="section-title">{rn[rg]} — {n} 항공사</div><div class="grid">{cards}</div></div>'

idx = f"""<!DOCTYPE html>
<html lang="ko"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>APG Korea — GP-275 항공사 목록</title>
<style>*{{margin:0;padding:0;box-sizing:border-box}}body{{font-family:'Apple SD Gothic Neo','Noto Sans KR',-apple-system,sans-serif;background:#f8f9fa;color:#333}}header{{background:linear-gradient(135deg,#0a1628,#1a2744);color:#fff;padding:48px 24px 36px;text-align:center}}header h1{{font-size:1.8rem;font-weight:900;margin-bottom:6px;letter-spacing:-0.5px}}header .sub{{font-size:0.85rem;opacity:.5;margin-bottom:4px}}header .badge{{display:inline-block;background:rgba(255,255,255,.1);border:1px solid rgba(255,255,255,.15);padding:4px 14px;border-radius:20px;font-size:.75rem;margin-top:10px}}.container{{max-width:960px;margin:0 auto;padding:40px 20px}}.section{{margin-bottom:40px}}.section-title{{font-size:13px;font-weight:700;color:#6a8aaa;letter-spacing:1px;text-transform:uppercase;margin-bottom:16px;padding-bottom:8px;border-bottom:1px solid #e5e7eb}}.grid{{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:20px}}.card{{background:#fff;border-radius:14px;overflow:hidden;box-shadow:0 1px 8px rgba(0,0,0,.06);text-decoration:none;color:inherit;display:block;transition:transform .2s,box-shadow .2s}}.card:hover{{transform:translateY(-2px);box-shadow:0 8px 24px rgba(0,0,0,.1)}}.card img{{width:100%;height:200px;object-fit:cover;background:#ddd}}.card-body{{padding:20px}}.card-body h3{{font-size:1.05rem;font-weight:800;margin-bottom:2px;display:flex;align-items:center;gap:6px}}.card-body h3 .code{{color:#e63946;font-weight:700;font-size:.85rem}}.card-body .hub{{color:#888;font-size:.8rem;margin-bottom:10px}}.card-body p{{font-size:.9rem;line-height:1.65;color:#555}}.card-body .meta{{margin-top:14px;display:flex;flex-wrap:wrap;gap:6px}}.card-body .meta span{{background:#eef2ff;color:#4f46e5;padding:3px 10px;border-radius:16px;font-size:.75rem;font-weight:600}}.footer{{text-align:center;padding:30px;color:#bbb;font-size:.75rem}}</style></head>
<body><header><h1>✈️ APG Korea</h1><div class="sub">GP-275 항공사 소개 · Instagram 컨텐츠</div><div class="badge">157 Airlines · 5 Regions</div></header><div class="container">{secs}</div><div class="footer">© 2026 APG Korea · Internal Use Only · kimdaeri-bot/apg-korea-docs</div></body></html>"""

with open(os.path.join(D, "index.html"), "w") as f:
    f.write(idx)
print("Updated index.html")
print("DONE!")
